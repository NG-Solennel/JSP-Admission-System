package net.sol.util;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import net.sol.model.AcademicUnit;
import net.sol.model.CourseDefinition;
import net.sol.model.Learner;
import net.sol.model.Semester;
import net.sol.model.StudentCourse;
import net.sol.model.StudentRegistration;
import net.sol.model.Teacher;

import com.google.gson.JsonObject;
import java.lang.reflect.Type;
import java.util.List;

public class Serializers {

    public static class CourseDefinitionSerializer implements JsonSerializer<CourseDefinition> {
        @Override
        public JsonElement serialize(CourseDefinition courseDefinition, Type typeOfSrc, JsonSerializationContext context) {
            // Define how to serialize CourseDefinition here
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("name", courseDefinition.getName());
            jsonObject.addProperty("code",courseDefinition.getCode());
            jsonObject.addProperty("description", courseDefinition.getDescription());
           
            return jsonObject;
        }
    }

    public static class TeacherSerializer implements JsonSerializer<Teacher> {
        @Override
        public JsonElement serialize(Teacher teacher, Type typeOfSrc, JsonSerializationContext context) {
            // Define how to serialize Teacher here
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("name", teacher.getNames());
            jsonObject.addProperty("qualification", teacher.getQualification().toString());
            jsonObject.addProperty("code", teacher.getCode());
            // Add other properties as needed
            return jsonObject;
        }
    }
    public static class SemesterSerializer implements JsonSerializer<Semester> {
        @Override
        public JsonElement serialize(Semester semester, Type typeOfSrc, JsonSerializationContext context) {
            // Define how to serialize Teacher here
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("name", semester.getName());
            jsonObject.addProperty("id", semester.getId());
            jsonObject.addProperty("startDate", semester.getStartDate().toString());
            jsonObject.addProperty("endDate", semester.getEndDate().toString());
            
            // Add other properties as needed
            return jsonObject;
        }
    }
    public static class AcademicUnitSerializer implements JsonSerializer<AcademicUnit> {
        @Override
        public JsonElement serialize(AcademicUnit academicUnit, Type typeOfSrc, JsonSerializationContext context) {
            // Define how to serialize Teacher here
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("name", academicUnit.getName());
            jsonObject.addProperty("id", academicUnit.getId());     
            // Add other properties as needed
            return jsonObject;
        }
    }
    
    public static class StudentRegistrationSerializer implements JsonSerializer<StudentRegistration> {
        @Override
        public JsonElement serialize(StudentRegistration stReg, Type typeOfSrc, JsonSerializationContext context) {
            // Define how to serialize Teacher here
            JsonObject jsonObject = new JsonObject();
            JsonObject semesterObj = new JsonObject();
            JsonObject studentObj = new JsonObject();
            JsonObject departmentObj = new JsonObject();
            jsonObject.addProperty("id", stReg.getId());
            jsonObject.addProperty("date", stReg.getDate().toString()); 
            Semester semester = stReg.getSemester();
            if(semester != null) {            	
            	semesterObj.addProperty("name", semester.getName());
            	semesterObj.addProperty("id", semester.getId());
            	semesterObj.addProperty("startDate", semester.getStartDate().toString());
            	semesterObj.addProperty("endDate", semester.getEndDate().toString());
            }
           Learner student = stReg.getStudent();
           if(student != null) {            	
           	studentObj.addProperty("name", student.getName());
           	studentObj.addProperty("id", student.getId());
           	studentObj.addProperty("photo", student.getPhoto().toString());
           	studentObj.addProperty("email",student.getEmail());
           	studentObj.addProperty("program", student.getProgram().getName());
           }
           AcademicUnit department = stReg.getDepartment();
           if(department != null) {            	
              	departmentObj.addProperty("name", department.getName());
              	departmentObj.addProperty("id",department.getId());
              }
           jsonObject.add("student", studentObj);
           jsonObject.add("semester", semesterObj);
            return jsonObject;
        }
    }
    public static class StudentCourseSerializer implements JsonSerializer<StudentCourse> {
        @Override
        public JsonElement serialize(StudentCourse studentCourse, Type typeOfSrc, JsonSerializationContext context) {
            // Define how to serialize Teacher here
            JsonObject jsonObject = new JsonObject();
            JsonObject course = new JsonObject();
            JsonObject semesterObj = new JsonObject();
            JsonObject courseDefObj = new JsonObject();
            JsonObject stRegObj = new JsonObject();
            
            Semester semester = studentCourse.getCourse().getSemester();
            if(semester != null) {            	
            	semesterObj.addProperty("name", semester.getName());
            	semesterObj.addProperty("id", semester.getId());
            	semesterObj.addProperty("startDate", semester.getStartDate().toString());
            	semesterObj.addProperty("endDate", semester.getEndDate().toString());
            }
            course.add("semester", semesterObj);
            CourseDefinition courseDefinition = studentCourse.getCourse().getCourseDefinition();
            courseDefObj.addProperty("code", courseDefinition.getCode());
            courseDefObj.addProperty("name", courseDefinition.getName());
            courseDefObj.addProperty("description", courseDefinition.getDescription());
            course.add("courseDefinition", courseDefObj);
            course.addProperty("id",studentCourse.getCourse().getId());
            List<Teacher> tutors = studentCourse.getCourse().getTutors();
            JsonArray tutorsArr = new JsonArray();
            for(Teacher teacher:tutors) {
            	JsonObject tutorObj = new JsonObject();            	
            	tutorObj.addProperty("name", teacher.getNames());
            	tutorObj.addProperty("qualification", teacher.getQualification().toString());
            	tutorObj.addProperty("code", teacher.getCode());
            	tutorsArr.add(tutorObj);
            }
            course.add("tutors", tutorsArr);
            stRegObj.addProperty("date", studentCourse.getStudentRegistration().getDate().toString());
            stRegObj.addProperty("status", studentCourse.getStudentRegistration().getStatus().toString());
            
            
            jsonObject.addProperty("credits", studentCourse.getCredits() );
            jsonObject.addProperty("results", studentCourse.getResults());
            jsonObject.add("course", course);
            jsonObject.add("studentRegistration", stRegObj);
            
            // Add other properties as needed
            return jsonObject;
        }
    }
}