package net.sol.util;

import com.google.gson.JsonElement;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import net.sol.model.AcademicUnit;
import net.sol.model.CourseDefinition;
import net.sol.model.Semester;
import net.sol.model.Teacher;

import com.google.gson.JsonObject;
import java.lang.reflect.Type;

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
            jsonObject.addProperty("academicYear", semester.getAcademicYear());
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
}