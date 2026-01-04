import pyodbc
import tkinter as tk
from tkinter import ttk, messagebox
from PIL import Image, ImageTk
import vlc


# DATABASE 
def connect_db():
    return pyodbc.connect(
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=localhost;"
        "Database=project;"
        "Trusted_Connection=yes;"
    )
#select
def run_select(query, params=None):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute(query, params or [])
    data = cursor.fetchall()
    conn.close()
    return data
#alter
def run_modify(query, params=None):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute(query, params or [])
    conn.commit()
    conn.close()

# GUI BASE
class Page(tk.Frame):
    def __init__(self, parent):
        super().__init__(parent, bg="white")
    def show(self):
        self.tkraise()

# PROFILE PAGE
class ProfilePage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)
       
        tk.Label(self, text="Profile Page",
                 font=("Arial", 50), bg="white").pack(pady=20)
    
        conn = connect_db()
        cur = conn.cursor()
        if role == "Student":
            cur.execute("SELECT st_firstname, st_lastname FROM Student WHERE st_ID=?", (user_id,))
        elif role == "Doctor":
            cur.execute("SELECT Dr_name FROM Doctor WHERE Dr_ID=?", (user_id,))
        elif role == "Assistant":
         cur.execute("SELECT TA_name FROM Assistants WHERE TA_ID=?", (user_id,))

        elif role == "Dean":
            cur.execute("SELECT Dean_name FROM Dean WHERE Dean_ID=?", (user_id,))
        row = cur.fetchone()
        if row:
            tk.Label(self, text=f"Name: {row[0]}", bg="white").pack()
        conn.close()
        #student
class StudentsListPage(Page):
    def __init__(self, parent):
        super().__init__(parent)

        tk.Label(self, text="All Students", font=("Arial", 60), bg="white").pack(pady=20)

        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)

        # ====== Treeview مثل CoursesPage ======
        columns = ("ID", "Name", "Level", "Faculty", "GPA")
        table = ttk.Treeview(table_frame, columns=columns, show="headings", height=20)
        for col in columns:
            table.heading(col, text=col)
            # أعمدة عريضة لتظهر كل البيانات
            if col == "Name":
                table.column(col, anchor="w", width=200)
            elif col == "Faculty":
                table.column(col, anchor="w", width=300)
            else:
                table.column(col, anchor="center", width=100)
        table.pack(fill="both", expand=True, side="left")

        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        # ====== جلب البيانات ======
        data = run_select("SELECT st_ID, st_firstname, st_lastname, level_name, faculty_name, st_GPA FROM Student")
        for row in data:
            st_id, firstname, lastname, level, faculty, gpa = row
            table.insert("", "end", values=(st_id, f"{firstname} {lastname}", level, faculty, gpa))

#students search
class StudentSearchPage(Page):
    def __init__(self, parent):
        super().__init__(parent)

        tk.Label(self, text="Find Student by ID",
                 font=("Arial", 35), bg="white").pack(pady=20)

        form = tk.Frame(self, bg="white")
        form.pack(pady=20)

        tk.Label(form, text="Student ID:", bg="white",
                 font=("Arial", 14)).grid(row=0, column=0, padx=10)

        self.entry_id = tk.Entry(form, font=("Arial", 14))
        self.entry_id.grid(row=0, column=1, padx=10)

        tk.Button(
            form,
            text="Search",
            font=("Arial", 12, "bold"),
            bg="#154c79",
            fg="white",
            command=self.search_student
        ).grid(row=0, column=2, padx=10)

        self.result = tk.Label(self, text="", font=("Arial", 18),
                               bg="white", fg="#154c79", justify="left")
        self.result.pack(pady=30)

    def search_student(self):
        st_id = self.entry_id.get().strip()
        if not st_id.isdigit():
            messagebox.showerror("Error", "Invalid Student ID")
            return

        data = run_select("""
            SELECT st_firstname, st_lastname, st_GPA, level_name, faculty_name
            FROM Student
            WHERE st_ID = ?
        """, (int(st_id),))

        if data:
            firstname, lastname, gpa, level, faculty = data[0]
            self.result.config(
                text=f"Name: {firstname} {lastname}\n"
                     f"GPA: {gpa}\n"
                     f"Level: {level}\n"
                     f"Faculty: {faculty}"
            )
        else:
            self.result.config(text="Student not found")
#dean page
class DeanProfilePage(Page):
    def __init__(self, parent, dean_id):
        super().__init__(parent)
        self.configure(bg="white")

        # عنوان الصفحة
        tk.Label(self, text="Dean Profile", font=("Arial", 60), bg="white").pack(pady=20)

        # ===== جلب اسم العميد =====
        data = run_select("SELECT Dean_name FROM Dean WHERE Dean_ID=?", (dean_id,))
        dean_name = data[0][0] if data else "Name not found"

        # ===== اسم العميد تحت العنوان =====
        tk.Label(self, text=dean_name, font=("Arial", 15, "bold"), bg="white").pack(pady=10)

        content_frame = tk.Frame(self, bg="white")
        content_frame.pack(fill="both", expand=True, padx=20, pady=20)

        # ===== صورة العميد =====
        image_frame = tk.Frame(content_frame, bg="white")
        image_frame.pack(side="right", padx=20)

        img_path = "images/Dean.jpg"  # تأكدي من اسم الصورة
        try:
            img = Image.open(img_path)
            img = img.resize((750, 750))
            self.photo = ImageTk.PhotoImage(img)
            tk.Label(image_frame, image=self.photo, bg="white").pack()
        except FileNotFoundError:
            pass  

# ================= COURSES PAGE =================
class CoursesPage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)
        tk.Label(self, text="Courses Page", font=("Arial", 60), bg="white").pack(pady=20)

        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)

        table = ttk.Treeview(table_frame, columns=("Course", "Doctor", "Hours"), show="headings", height=15)
        for col in ("Course", "Doctor", "Hours"):
            table.heading(col, text=col)
            table.column(col, anchor="center", width=200)
        table.pack(fill="both", expand=True, side="left")

        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        # =================== QUERY ===================
        if role == "Student":
            query = """
                SELECT c.course_name, c.Dr_name, c.credit_hrs
                FROM Course c
                JOIN Enroll e ON c.course_code = e.course_code
                WHERE e.st_ID = ?
            """
            data = run_select(query, (user_id,))

        elif role == "Doctor":
            query = """
                SELECT course_name, Dr_name, credit_hrs
                FROM Course
                WHERE Dr_ID = ?
            """
            data = run_select(query, (user_id,))

        elif role == "Assistant":
            query = """
                SELECT c.course_name, c.Dr_name, c.credit_hrs
                FROM Course c
                JOIN Manage m ON c.Dr_ID = m.Dr_ID
                WHERE m.TA_ID = ?
            """
            data = run_select(query, (user_id,))
        elif role == "Dean":
    # Dean يشوف كل الكورسات
          data = run_select("SELECT course_name, Dr_name, credit_hrs FROM Course")
        else:
            data = []

        for row in data:
            table.insert("", "end", values=(row[0], row[1], row[2]))


# ================= ATTENDANCE PAGE =================
class AttendancePage(Page):
    def __init__(self, parent, user_id=None, role=None):
        super().__init__(parent)
        tk.Label(self, text="Attendance", font=("Arial", 60), bg="white").pack(pady=20)

        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)

        table = ttk.Treeview(table_frame, columns=("Course", "Date", "Status"), show="headings", height=10)
        for col in ("Course", "Date", "Status"):
            table.heading(col, text=col)
            table.column(col, anchor="center", width=180)
        table.pack(fill="both", expand=True, side="left")

        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        # =================== QUERY ===================
        if role == "Student":
            query = "SELECT course_name, att_date, status FROM Attendance WHERE st_ID=?"
            data = run_select(query, (user_id,))

        elif role == "Doctor":
            query = """
                SELECT A.course_name, A.att_date, A.status
                FROM Attendance A
                JOIN Course C ON A.course_name = C.course_name
                WHERE C.Dr_ID = ?
            """
            data = run_select(query, (user_id,))

        elif role == "Assistant":
            query = """
                SELECT A.course_name, A.att_date, A.status
                FROM Attendance A
                JOIN Course C ON A.course_name = C.course_name
                JOIN Manage M ON C.Dr_ID = M.Dr_ID
                WHERE M.TA_ID = ?
            """
            data = run_select(query, (user_id,))
        elif role == "Dean":
    # Dean يشوف كل الحضور
         data = run_select("SELECT course_name, att_date, status FROM Attendance")

        else:
            data = []

        for row in data:
            status = "Present" if row[2] == 1 else "Absent"
            table.insert("", "end", values=(row[0], row[1], status))

# ================= OFFICE HOURS PAGE =================
class OfficeHoursPage(Page):
    def __init__(self, parent, user_id=None, role=None):
        super().__init__(parent)
        self.configure(bg="white")

        tk.Label(self, text="Office Hours", font=("Arial", 60), bg="white").pack(pady=20)

        if role == "Student":
            notebook = ttk.Notebook(self)
            notebook.pack(fill="both", expand=True, padx=10, pady=10)

            # Doctor tab
            doctor_frame = tk.Frame(notebook, bg="white")
            notebook.add(doctor_frame, text="Doctor")
            self.doctor_table = ttk.Treeview(doctor_frame, columns=("Name", "Day", "From", "To"), show="headings", height=8)
            for col in ("Name", "Day", "From", "To"):
                self.doctor_table.heading(col, text=col)
                self.doctor_table.column(col, anchor="center", width=150)
            self.doctor_table.pack(fill="both", expand=True)
            doctor_data = run_select("SELECT Dr_ID, Dr_name, day, start_time, end_time FROM Dr_office_hours")
            for row in doctor_data:
                self.doctor_table.insert("", "end", values=(row[1], row[2], row[3], row[4]))
            self.doctor_table.bind("<Double-1>", self.show_doctor_courses)

            # Assistant tab
            ta_frame = tk.Frame(notebook, bg="white")
            notebook.add(ta_frame, text="Assistant")
            self.ta_table = ttk.Treeview(ta_frame, columns=("Name", "Day", "From", "To"), show="headings", height=8)
            for col in ("Name", "Day", "From", "To"):
                self.ta_table.heading(col, text=col)
                self.ta_table.column(col, anchor="center", width=150)
            self.ta_table.pack(fill="both", expand=True)
            ta_data = run_select("SELECT TA_name, day, start_time, end_time FROM TA_office_hours")
            for row in ta_data:
                self.ta_table.insert("", "end", values=(row[0], row[1], row[2], row[3]))

        elif role == "Doctor":
            table_frame = tk.Frame(self, bg="white")
            table_frame.pack(fill="both", expand=True, padx=10, pady=10)
            table = ttk.Treeview(table_frame, columns=("Day", "From", "To"), show="headings", height=8)
            for col in ("Day", "From", "To"):
                table.heading(col, text=col)
                table.column(col, anchor="center", width=150)
            table.pack(fill="both", expand=True, side="left")
            scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
            scrollbar.pack(side="right", fill="y")
            table.configure(yscrollcommand=scrollbar.set)

            data = run_select("SELECT day, start_time, end_time FROM Dr_office_hours WHERE Dr_ID=?", (user_id,))
            for row in data:
                table.insert("", "end", values=(row[0], row[1], row[2]))

        elif role == "Assistant":
            table_frame = tk.Frame(self, bg="white")
            table_frame.pack(fill="both", expand=True, padx=10, pady=10)
            table = ttk.Treeview(table_frame, columns=("Day", "From", "To"), show="headings", height=8)
            for col in ("Day", "From", "To"):
                table.heading(col, text=col)
                table.column(col, anchor="center", width=150)
            table.pack(fill="both", expand=True, side="left")
            scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
            scrollbar.pack(side="right", fill="y")
            table.configure(yscrollcommand=scrollbar.set)

            data = run_select("SELECT day, start_time, end_time FROM TA_office_hours WHERE TA_ID=?", (user_id,))
            for row in data:
                table.insert("", "end", values=(row[0], row[1], row[2]))

        elif role == "Dean":
            # Dean يشوف كل ساعات الدكاترة وAssistants
            notebook = ttk.Notebook(self)
            notebook.pack(fill="both", expand=True, padx=10, pady=10)

            doctor_frame = tk.Frame(notebook, bg="white")
            notebook.add(doctor_frame, text="Doctor")
            doctor_table = ttk.Treeview(doctor_frame, columns=("Name", "Day", "From", "To"), show="headings", height=8)
            for col in ("Name", "Day", "From", "To"):
                doctor_table.heading(col, text=col)
                doctor_table.column(col, anchor="center", width=150)
            doctor_table.pack(fill="both", expand=True)
            doctor_data = run_select("SELECT Dr_name, day, start_time, end_time FROM Dr_office_hours")
            for row in doctor_data:
                doctor_table.insert("", "end", values=(row[0], row[1], row[2], row[3]))

            ta_frame = tk.Frame(notebook, bg="white")
            notebook.add(ta_frame, text="Assistant")
            ta_table = ttk.Treeview(ta_frame, columns=("Name", "Day", "From", "To"), show="headings", height=8)
            for col in ("Name", "Day", "From", "To"):
                ta_table.heading(col, text=col)
                ta_table.column(col, anchor="center", width=150)
            ta_table.pack(fill="both", expand=True)
            ta_data = run_select("SELECT TA_name, day, start_time, end_time FROM TA_office_hours")
            for row in ta_data:
                ta_table.insert("", "end", values=(row[0], row[1], row[2], row[3]))

    def show_doctor_courses(self, event):
        item = self.doctor_table.selection()[0]
        dr_name = self.doctor_table.item(item, "values")[0]
        courses = run_select("SELECT course_name FROM Course WHERE Dr_name=?", (dr_name,))
        if not courses:
            messagebox.showinfo("Info", f"No courses found for {dr_name}")
            return
        win = tk.Toplevel(self)
        win.title(f"{dr_name} Courses")
        win.geometry("400x300")
        table = ttk.Treeview(win, columns=("Course",), show="headings")
        table.heading("Course", text="Course")
        table.column("Course", anchor="center", width=250)
        table.pack(fill="both", expand=True, padx=10, pady=10)
        for row in courses:
            table.insert("", "end", values=(row[0],))
#project page
class ProjectsPage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)
        self.configure(bg="white")

        tk.Label(self, text="Projects", font=("Arial", 60), bg="white").pack(pady=20)

        # ================= Table Frame =================
        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)

        table = ttk.Treeview(
            table_frame, 
            columns=("Course & Project", "Deadline", "Description"), 
            show="headings", 
            height=10
        )
        for col in ("Course & Project", "Deadline", "Description"):
            table.heading(col, text=col)
            table.column(col, anchor="center", width=200)
        table.pack(fill="both", expand=True, side="left")

        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        # ================= Fetch Data =================
        data = []

        if role == "Student":
            query = """
                SELECT p.course_name, p.project_name, p.deadline, p.description
                FROM Project p
                JOIN Enroll e ON p.course_code = e.course_code
                WHERE e.st_ID = ?
            """
            data = run_select(query, (user_id,))
        
        elif role == "Doctor":
            query = """
                SELECT P.course_name, P.project_name, P.deadline, P.description
                FROM Project P
                JOIN Course C ON P.course_code = C.course_code
                WHERE C.Dr_ID = ?
            """
            data = run_select(query, (user_id,))
        
        elif role == "Assistant":
            query = """
                SELECT P.course_name, P.project_name, P.deadline, P.description
                FROM Project P
                JOIN Course C ON P.course_code = C.course_code
                WHERE C.Dr_name IN (
                    SELECT Dr_name FROM Manage WHERE TA_ID = ?
                )
            """
            data = run_select(query, (user_id,))
        
        elif role == "Dean":
            query = """
                SELECT P.course_name, P.project_name, P.deadline, P.description
                FROM Project P
                JOIN Course C ON P.course_code = C.course_code
            """
            data = run_select(query)
        
        else:
            data = []

        # ================= Insert Data into Table =================
        for row in data:
            table.insert("", "end", values=(f"{row[0]} - {row[1]}", row[2], row[3]))

class ClassroomPage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)
        tk.Label(self, text="My Classes", font=("Arial", 60), bg="white").pack(pady=20)
        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)
        table = ttk.Treeview(table_frame, columns=("Course & Room", "Status"), show="headings", height=10)
        table.heading("Course & Room", text="Course & Room")
        table.heading("Status", text="Status")
        table.column("Course & Room", anchor="center", width=300)
        table.column("Status", anchor="center", width=200)
        table.pack(fill="both", expand=True, side="left")
        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        if role == "Student":
            query = """
                SELECT C.course_name, C.buildingNo,
                    CASE WHEN C.lecture_cancelled=1 THEN 'Lecture is cancelled'
                         ELSE 'Lecture is not cancelled'
                    END as lecture_status
                FROM Classroom C
                JOIN Classroom_Student CS ON C.class_ID = CS.class_ID
                WHERE CS.st_ID = ?
            """
            data = run_select(query, (user_id,))
            for row in data:
                table.insert("", "end", values=(f"{row[0]} - {row[1]}", row[2]))
        else:
            tk.Label(self, text="Classroom info is only available for students.", bg="white").pack(pady=20)
#schedule
class SchedulePage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)

        tk.Label(self, text="My Schedule", font=("Arial", 60), bg="white").pack(pady=20)

        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)

        table = ttk.Treeview(
            table_frame,
            columns=("Course", "Day", "From", "To", "Room"),
            show="headings",
            height=10
        )

        table.heading("Course", text="Course")
        table.heading("Day", text="Day")
        table.heading("From", text="From")
        table.heading("To", text="To")
        table.heading("Room", text="Room")

        table.column("Course", anchor="center", width=300)
        table.column("Day", anchor="center", width=120)
        table.column("From", anchor="center", width=80)
        table.column("To", anchor="center", width=80)
        table.column("Room", anchor="center", width=120)

        table.pack(fill="both", expand=True, side="left")

        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        # ===== STUDENT SCHEDULE =====
        if role == "Student":
            query = """
                SELECT S.course_name, D.Dr_name, S.day, S.start_time, S.end_time, C.buildingNo
                FROM Schedule S
                JOIN Classroom_Student CS ON S.class_ID = CS.class_ID
                JOIN Doctor D ON S.Dr_ID = D.Dr_ID
                JOIN Classroom C ON S.class_ID = C.class_ID
                WHERE CS.st_ID = ?
                ORDER BY S.day, S.start_time
            """
            data = run_select(query, (user_id,))

            for row in data:
                course_info = f"{row[0]} - {row[1]}"
                table.insert("", "end", values=(course_info, row[2], row[3], row[4], row[5]))

        # ===== DOCTOR SCHEDULE =====
        elif role == "Doctor":
            query = """
                SELECT S.course_name, D.Dr_name, S.day, S.start_time, S.end_time, C.buildingNo
                FROM Schedule S
                JOIN Doctor D ON S.Dr_ID = D.Dr_ID
                JOIN Classroom C ON S.class_ID = C.class_ID
                WHERE S.Dr_ID = ?
                ORDER BY S.day, S.start_time
            """
            data = run_select(query, (user_id,))

            for row in data:
                course_info = f"{row[0]} - {row[1]}"
                table.insert("", "end", values=(course_info, row[2], row[3], row[4], row[5]))

#vacation course

class VacationCoursesPage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)
        tk.Label(self, text="Vacation Courses", font=("Arial", 40), bg="white").pack(pady=20)

        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)

        columns = ("Track Name", "Doctor", "Start Date", "End Date", "Dean")
        table = ttk.Treeview(table_frame, columns=columns, show="headings", height=15)
        for col in columns:
            table.heading(col, text=col)
            table.column(col, anchor="w", width=250)
        table.pack(fill="both", expand=True, side="left")

        vsb = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        vsb.pack(side="right", fill="y")
        hsb = ttk.Scrollbar(table_frame, orient="horizontal", command=table.xview)
        hsb.pack(side="bottom", fill="x")
        table.configure(yscrollcommand=vsb.set, xscrollcommand=hsb.set)

        if role == "Student":
            query = """
                SELECT track_name, Dr_name, startDate, endDate, dean_name
                FROM Vacation_course
                WHERE faculty_code IN (
                    SELECT faculty_code 
                    FROM Student 
                    WHERE st_ID = ?
                )
            """
            data = run_select(query, (user_id,))
        elif role == "Dean":
            query = """
                SELECT track_name, Dr_name, startDate, endDate, dean_name
                FROM Vacation_course
            """
            data = run_select(query)
        else:
            data = []

        if data:
            for row in data:
                table.insert("", "end", values=(row[0], row[1], row[2], row[3], row[4]))
        else:
            tk.Label(self, text="No vacation courses available for your role.", bg="white").pack(pady=20)

#class room dr
class ClassroomPage(Page):
    def __init__(self, parent, user_id, role):
        super().__init__(parent)
        tk.Label(self, text="My Classes", font=("Arial", 60), bg="white").pack(pady=20)
        table_frame = tk.Frame(self, bg="white")
        table_frame.pack(fill="both", expand=True, padx=10, pady=10)
        table = ttk.Treeview(table_frame, columns=("Course & Room", "Status"), show="headings", height=10)
        table.heading("Course & Room", text="Course & Room")
        table.heading("Status", text="Status")
        table.column("Course & Room", anchor="center", width=300)
        table.column("Status", anchor="center", width=200)
        table.pack(fill="both", expand=True, side="left")
        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
        scrollbar.pack(side="right", fill="y")
        table.configure(yscrollcommand=scrollbar.set)

        if role == "Student":
            query = """
                SELECT C.course_name, C.buildingNo,
                    CASE WHEN C.lecture_cancelled=1 THEN 'Lecture is cancelled'
                         ELSE 'Lecture is not cancelled'
                    END as lecture_status
                FROM Classroom C
                JOIN Classroom_Student CS ON C.class_ID = CS.class_ID
                WHERE CS.st_ID = ?
            """
            data = run_select(query, (user_id,))
        elif role == "Doctor":
            query = """
                SELECT course_name, buildingNo,
                    CASE WHEN lecture_cancelled=1 THEN 'Lecture is cancelled'
                         ELSE 'Lecture is not cancelled'
                    END as lecture_status
                FROM Classroom
                WHERE Dr_ID = ?
            """
            data = run_select(query, (user_id,))
        else:
            tk.Label(self, text="Classroom info is only available for students and doctors.", bg="white").pack(pady=20)
            data = []

        for row in data:
            table.insert("", "end", values=(f"{row[0]} - {row[1]}", row[2]))

#MAIN USER APP 
class UserApp(tk.Toplevel):
    def __init__(self, user_id, full_name, role):
        super().__init__()
        self.title(full_name)
        self.geometry("700x400")
        menu = tk.Frame(self, bg="#154c79", width=180)
        menu.pack(side="left", fill="y")
        container = tk.Frame(self, bg="white")
        container.pack(side="right", fill="both", expand=True)
        
        pages = {
            "Profile": ProfilePage(container, user_id, role),
            "Courses": CoursesPage(container, user_id, role),
            "Attendance": AttendancePage(container, user_id, role),
            "Office Hours": OfficeHoursPage(container, user_id, role)
        }

        if role == "Student":
            pages["Projects"] = ProjectsPage(container, user_id, role)
            pages["My Classes"] = ClassroomPage(container, user_id, role)
            pages["Schedule"] = SchedulePage(container, user_id, role)
            pages["Vacation Courses"] = VacationCoursesPage(container, user_id, role)
        elif role == "Doctor":
            pages["My Classes"] = ClassroomPage(container, user_id, role)
            pages["Courses"] = CoursesPage(container, user_id, role)
            pages["Attendance"] = AttendancePage(container, user_id, role)
            pages["Projects"] = ProjectsPage(container, user_id, role)
            pages["Schedule"] = SchedulePage(container, user_id, role)
        elif role == "Assistants":
            pages["Courses"] = CoursesPage(container, user_id, role)
            pages["Attendance"] = AttendancePage(container, user_id, role)
            pages["Projects"] = ProjectsPage(container, user_id, role)
        elif role == "Dean":
            pages["Projects"] = ProjectsPage(container, user_id, role)
            pages["Vacation Courses"] = VacationCoursesPage(container, user_id, role)
            pages["Students List"] = StudentsListPage(container)
            pages["Find Student"] = StudentSearchPage(container)
            
            pages["Profile"] = DeanProfilePage(container, user_id)


        for p in pages.values():
            p.place(relwidth=1, relheight=1)

        for name, page in pages.items():
            tk.Button(menu, text=name, command=page.show,
                      bg="#2980b9", fg="white",
                      font=("Arial", 12, "bold"),
                      relief="flat").pack(fill="x", pady=5, padx=5)

        list(pages.values())[0].show()
#Video
def play_video(path):
    instance = vlc.Instance()
    media = instance.media_new(path)
    player = instance.media_player_new()
    player.set_media(media)
    player.set_hwnd(canvas.winfo_id())
    player.play()
    return player

def go_next():
    player.stop()
    video_frame.pack_forget()
    role_frame.pack(fill="both", expand=True)
#LOGIN
def open_login_window(role):
    win = tk.Toplevel(root)
    win.geometry("300x200")
    tk.Label(win, text=f"{role} Login", font=("Arial", 16, "bold")).pack(pady=10)
    entry = tk.Entry(win)
    entry.pack(pady=10)
    def login_action():
        uid = entry.get()
        if not uid.isdigit():
            messagebox.showerror("Error", "Invalid ID")
            return
        uid = int(uid)
        win.destroy()
        app = UserApp(uid, f"{role} #{uid}", role)
        app.mainloop()
    tk.Button(win, text="Login", bg="#154c79", fg="white",
              font=("Arial", 12, "bold"), command=login_action).pack()
# MAIN WINDOW 
root = tk.Tk()
root.attributes("-fullscreen", True)
root.configure(bg="#f0f4ff")
video_frame = tk.Frame(root, bg="black")
video_frame.pack(fill="both", expand=True)
canvas = tk.Canvas(video_frame, bg="black")
canvas.pack(fill="both", expand=True)
next_button = tk.Button(video_frame, text="Next", font=("Arial", 20),
                        bg="#F8F8F8", fg="#154c79",
                        activebackground="#154c79",
                        activeforeground="#F8F8F8",
                        command=go_next)
next_button.place(relx=0.9, rely=0.9, anchor="se")
player = play_video("videos/RST.mp4")
role_frame = tk.Frame(root, bg="#f0f4ff")
img = Image.open("images/RST_logo.jpg").resize((150, 150))
photo = ImageTk.PhotoImage(img)
tk.Label(role_frame, image=photo, bg="#f0f4ff").place(relx=1, y=10, anchor="ne")
tk.Label(role_frame, text="Welcome To RST!", font=("Arial", 25, "bold"),
         bg="#F8F8F8", fg="#154c79").pack(pady=30)
for r in ["Student", "Doctor", "Assistant", "Dean"]:
    tk.Button(role_frame, text=r, font=("Arial", 14, "bold"),
              bg="#154c79", fg="white", width=20, height=2,
              command=lambda x=r: open_login_window(x)).pack(pady=10)
root.mainloop() 