<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admission Form</title>
    <link rel="stylesheet" href="../css/form.css" />
  </head>
  <body>
    <main id="main" class="container">
      <div class="row">
        <div class="col-xs-12 col-lg-offset-3 col-lg-6">
          <div class="m-b-md text-center">
            <h1 id="title">Admission Form</h1>
            <p id="description" class="description" class="text-center">
              Fill in this form to join our institution
            </p>
          </div>
          <form
            method="POST"
            action=""
            id="admission-form"
            name="admission-form"
          >
            <fieldset>
              <label for="name" id="name-label">
                Name *
                <input
                  class=""
                  type="text"
                  autocomplete="off"
                  id="name"
                  name="name"
                  placeholder="Enter your name (required)"
                />
              </label>
              <small class="error" id="name-error"
                >Please provide a name</small
              >
            </fieldset>
            <fieldset>
              <label for="email" id="email-label">
                Please provide your email *
                <input
                  class=""
                  type="email"
                  id="email"
                  name="email"
                  autocomplete="off"
                  placeholder="Enter your email (required)"
                />
              </label>
              <small class="error" id="email-error"
                >Please provide an email</small
              >
            </fieldset>
            <fieldset>
              <label for="guardian-name" id="name-label">
                Guardian Name *
                <input
                  class=""
                  type="text"
                  autocomplete="off"
                  id="guardian-name"
                  name="guardian-name"
                  placeholder="Enter your name (required)"
                />
              </label>
              <small class="error" id="guardian-name-error"
                >Please provide a guardian name</small
              >
            </fieldset>
            <fieldset>
              <label for="guardian-email" id="email-label">
                Please provide guardian email *
                <input
                  class=""
                  type="email"
                  id="guardian-email"
                  name="guardian-email"
                  autocomplete="off"
                  placeholder="Enter your guardian email (required)"
                />
              </label>
              <small class="error" id="guardian-email-error"
                >Please provide guardian email</small
              >
            </fieldset>
            <fieldset>
              <label for="number" id="number-label">
                Age *
                <input
                  class=""
                  type="number"
                  id="age"
                  name="age"
                  min="8"
                  max="112"
                  placeholder="Enter you age (required)"
                />
              </label>
              <small class="error" id="age-error"
                >Please provide your age</small
              >
            </fieldset>
            <fieldset>
              <label for="dropdown">
                Marital Status
                <select id="dropdown" name="dropdown" class="m-t-xs">
                  <option value="student">Single</option>
                  <option value="ftLob">Married</option>
                  <option value="ftLearner">Divorced</option>
                  <option value="notSaying">Widow/widower</option>
                  <option value="other">Separated</option>
                </select>
              </label>
            </fieldset>
            <fieldset>
              <label for="dropdown">
                Select your program
                <select id="dropdown" name="dropdown" class="m-t-xs">
                  <option value="Day">Day</option>
                  <option value="Evening">Evening</option>
                </select>
              </label>
            </fieldset>
            <fieldset>
              <div class="labels">Faculty *</div>
              <div class="radio-content">
                <label class="m-b-xs">
                  <input
                    type="radio"
                    name="admission-form-faculty"
                    value="Information Technology"
                    checked
                  />
                  Information Technology
                </label>
                <label class="m-b-xs">
                  <input
                    type="radio"
                    name="admission-form-faculty"
                    value="Business Management"
                  />
                  Business Management
                </label>
              </div>
            </fieldset>
            <fieldset>
              <label for="admission-form-department" id="department-label">
                Choose Department
                <select
                  id="admission-form-department"
                  name="admission-form-department"
                  class="m-t-xs"
                >
                  <option value="softwareEngineering" selected>
                    Software Engineering
                  </option>
                  <option value="networking">Networking</option>
                  <option value="informationManagement">
                    Information Management
                  </option>
                </select>
              </label>
            </fieldset>
            <fieldset>
              <label for="admission-form-suggestions">
                Any Comments or Suggestions?
                <textarea id="admission-form-comments"></textarea>
              </label>
              <small class="error" id="desc-error"
                >Description cannot exceed 200 characters</small
              >
            </fieldset>
            <button id="submit" type="submit" class="btn">
              Submit the form
            </button>
          </form>
        </div>
      </div>
    </main>
    <script src="script.js"></script>
  </body>
</html>
