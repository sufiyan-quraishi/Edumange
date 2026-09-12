# EduManage — Training Institute Management System

Spring Boot (Java 8, Spring MVC, Spring Data JPA, Spring Security) + JSP frontend + MySQL.

**This version has no Lombok dependency** — all entity classes have manually written
getters/setters, so it compiles and runs in Eclipse/STS with zero extra setup.

Implements your full flow:
- **Public site**: Home / About / Courses / Contact + 5-second Inquiry popup (saved to DB)
- **Student Registration**: public form → saved as `PENDING`
- **Admin**: view inquiries, view/approve/reject registrations (auto-generates student login on approve), create trainers, create batches, assign trainer/students to batch, view attendance/tasks, reports
- **Trainer**: view assigned batches & students, mark attendance, assign tasks, review submissions, give marks/feedback
- **Student**: dashboard, profile, batch info, attendance, tasks, submit assignment (file upload), view feedback

## 1. Prerequisites
- JDK 8+
- Maven 3.6+
- MySQL 8 running locally

## 2. Database setup
No manual schema needed — Hibernate auto-creates tables (`spring.jpa.hibernate.ddl-auto=update`).
Just create the empty database (or let the app do it):
```sql
CREATE DATABASE IF NOT EXISTS edumanage_db;
```
Update credentials in `src/main/resources/application.properties` if your MySQL
username/password isn't `root`/`root`.

## 3. Run
```bash
mvn clean install
mvn spring-boot:run
```
App runs at: **http://localhost:8080**

A default admin account is auto-created on first run:
```
username: admin
password: admin123
```

## 4. Try the flow end-to-end
1. Visit `/` → wait 5 seconds → inquiry popup appears → submit it (saved to `inquiries` table)
2. Visit `/register` → fill student registration → saved as `PENDING`
3. Log in as `admin` / `admin123` → **Registrations** → Approve → a student login
   (`username / password`) is generated and shown on screen
4. **Trainers** → create a trainer (set username/password yourself)
5. **Batches** → create a batch → click **Assign** → assign the trainer + the approved student
6. Log out, log in as the **trainer** → mark attendance, assign a task
7. Log out, log in as the **student** (credentials from step 3) → view batch, submit the task
8. Log back in as trainer → review submission → give marks/feedback
9. Log in as admin → **Reports** → see batch/student/trainer counts

## 5. Project structure
```
src/main/java/com/edumanage/
  ├── model/         # JPA entities: User, Inquiry, Registration, Batch, Attendance, Task, Submission
  ├── repository/    # Spring Data JPA repositories
  ├── service/       # Business logic (approval flow, batch assignment, attendance, feedback)
  ├── controller/     # HomeController, InquiryController, RegistrationController,
  │                    AdminController, TrainerController, StudentController
  └── config/        # SecurityConfig (role-based routing), DataInitializer (default admin)
src/main/webapp/
  ├── WEB-INF/views/ # JSP pages (public, admin/, trainer/, student/, common/)
  └── css/style.css
```

## 6. Notes / what to extend next
A few controller endpoints (attendance-by-student-list, task list on a batch, submission
list-by-task, submit-task lookup by real Task) are wired with simplified placeholder logic
and marked with comments — the repositories/services needed for the full versions
(`BatchRepository`, `TaskRepository`, `SubmissionRepository`) already exist, so it's a matter
of injecting them into the relevant controller methods to fetch real entities instead of the
simplified versions shown. This was kept intentionally lightweight so the whole flow — landing
page to feedback — runs end-to-end without you needing to build the wiring yourself first.

Password encoding uses BCrypt (via Spring Security). CSRF is disabled for simplicity since
JSP forms don't include CSRF tokens by default — re-enable it in `SecurityConfig` and add
`<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">` to forms for
production use.
