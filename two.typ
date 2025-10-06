#import "vantage-typst.typ": vantage, styled-link, term, skill
#let configuration = yaml("configuration.yaml")


#vantage(
  name: configuration.contacts.name,
  links: (
    (name: "phone", link: "tel:" + configuration.contacts.phone, display: configuration.contacts.phone),
    (name: "email", link: "mailto:"+ configuration.contacts.email),
    (name: "website", link: configuration.contacts.website.url, display: configuration.contacts.website.displayText),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
//    (name: "location", link: "", display: configuration.contacts.address)
  ),
  tagline: (configuration.tagline),
  [

    == Experience

    #for job in configuration.jobs [
      === #job.company.name \
      _ #job.position _\
      #term[#job.from --- #job.to][#job.location]

      #for point in job.description [
        - #point
      ]
    ]

    == Research & Leadership

    #for (title, description, group, from, to, location) in configuration.research [
      === #group \
      _ #title _\
      #term[#from --- #to][#location]

      #for bullet in description [
        - #bullet
      ]
    ]
  ],
  [
    == Objective

    #configuration.objective

    == Education

    #for edu in configuration.education [
      === #edu.institution \
      _ #edu.majors.join(", ")\; Minor in #edu.minor\; Graduating #edu.to _\
      #term[#edu.from --- #edu.to][#edu.location]

      - #edu.gpa GPA
      #for line in edu.blurb [
        - #line #linebreak()
      ]
    ]

    // == Technical Expertise

    // #for expertise in configuration.technical_expertise [
    //   #skill(expertise.name, expertise.level)
    // ]

    == Skills/Exposure

    #box(height: 32%)[
    #columns(3, gutter: 4%)[
    #for skill in configuration.skills.programming_languages + configuration.skills.frameworks [
      - #skill
      #v(.05em)
    ]
    ]
    ]

    // == Methodology/Approach
    // #for method in configuration.methodology [
    //   • #method
    // ]


    #colbreak()

    == Tools
    #for tool in configuration.skills.platforms [
      • #tool
    ]


    == Associations

    #for achievement in configuration.clubs_and_associations [
      - #achievement
    ]

  ]
)
