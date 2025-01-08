#import "basic-lib.typ": *


#let configuration = yaml("configuration.yaml")

// Put your personal information here, replacing mine
#let (name, address, email, github, linkedin, phone, website) = configuration.contacts
#let github = github
#let linkedin = linkedin
#let personal-site = website

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: address,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "PT Sans",
  paper: "us-letter",
)

#configuration.tagline

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "")
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education

#for (institution, degree, majors, from, to, location, blurb, minor) in configuration.education [
#edu(
  institution: institution,
  location: location,
  dates: dates-helper(start-date: from, end-date: to),
  degree: degree + " in " + majors.join(", ") + "; Minor: " + minor,
)
#for line in blurb [
  - #line
]
]


== Work Experience

#for (position, company, description, from, to, tags, location) in configuration.jobs [
#work(
  title: position,
  location: location,
  company: company.name,
  dates: dates-helper(start-date: from, end-date: to),
)
#for line in description [
  - #line
]
]

// == Projects

// #project(
//   name: "Hyperschedule",
//   // Role is optional
//   role: "Maintainer",
//   // Dates is optional
//   dates: dates-helper(start-date: "Nov 2023", end-date: "Present"),
//   // URL is also optional
//   url: "hyperschedule.io",
// )
// - Maintain open-source scheduler used by 7000+ users at the Claremont Consortium with TypeScript, React and MongoDB
//   - Manage PR reviews, bug fixes, and coordinate with college for releasing scheduling data and over \$1500 of yearly funding
// - Ensure 99.99% uptime during peak loads of 1M daily requests during course registration through redundant servers

== Research & Leadership

#for rs in configuration.research [
  #work(
    title: rs.title,
    location: rs.location,
    company: rs.group,
    dates: dates-helper(start-date: rs.from, end-date: rs.to),
  )
    #for line in rs.description [
      - #line
    ]
]

// == Extracurricular Activities

// #box(height: 27pt)[
//   #columns(4, gutter: 1%)[
// #for ec in configuration.clubs_and_associations [

//   -  #ec
// ]
// ]
// ]


// #extracurriculars(
//   activity: "Science Olympiad Volunteering",
//   dates: "Sep 2023 --- Present"
// )
// - Volunteer and write tests for tournaments, including LA Regionals and SoCal State \@ Caltech

// #certificates(
//   name: "OSCP",
//   issuer: "Offensive Security",
//   // url: "",
//   date: "Oct 2024",
// )
== Skills & Associations
- *Programming Languages*: #configuration.skills.programming_languages.join(", ")
- *Technologies*: #configuration.skills.frameworks.join(", ")
- *Platforms*: #configuration.skills.platforms.join(", ")
- *Associations*: #configuration.clubs_and_associations.join(", ")
