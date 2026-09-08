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
  location: "",
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

#for (institution, majors, from, to, location, blurb, minor) in configuration.education [
#edu(
  institution: institution,
  location: location,
  dates: dates-helper(start-date: from, end-date: to),
  degree: majors.join(", ") + "; Minor in " + minor + "; Graduated " + to,
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

#pagebreak()

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

== Skills
- *Programming Languages*: #configuration.skills.programming_languages.join(", ")
- *Technologies*: #configuration.skills.frameworks.join(", ")
- *Platforms*: #configuration.skills.platforms.join(", ")
