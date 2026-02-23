# THA ORM Java Spring Example

A Spring Boot application for managing university enrollment data with JPA/Hibernate ORM.

## Setup

1. Configure MySQL credentials in `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/university?createDatabaseIfNotExist=true
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD
```

2. Create MySQL database by running the university.sql script

3. Create the MySQL user (if needed):
```sql
CREATE USER 'test'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON university.* TO 'test'@'127.0.0.1';
FLUSH PRIVILEGES;
```

4. Run the application:
```shell
./mvnw spring-boot:run
```

4. Access the app at http://localhost:8080

## Entities

- **Person** - Students and teachers with personal information
- **Teacher** - Teachers who can be assigned to courses
- **Degree** - Academic degree programs
- **Course** - Courses with credits, type (basic/mandatory/elective), year, and semester
- **AcademicYear** - Academic year periods
- **Enrollment** - Many-to-many relationship between students and courses per academic year

## Routes

| Route | Description |
|-------|-------------|
| `/` | List all persons |
| `/Persons/new` | Add a new person |
| `/Persons/{id}/courses` | View courses a person is enrolled in |
| `/courses` | List all courses |
| `/courses/new` | Add a new course |
| `/courses/{id}/students` | View students enrolled in a course |

## Database Schema

The application uses the following tables:
- `person` - Personal data (name, surname, city, address, phone, birthdate, gender, role)
- `teacher` - Teacher information
- `degree` - Degree programs
- `course` - Course details with foreign keys to teacher and degree
- `academic_year` - Academic year periods
- `enrollment` - Student-course enrollments with composite primary key
