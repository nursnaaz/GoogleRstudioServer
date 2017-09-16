#Step enable google API engine 
#generate service key
# download as json ----> key.json
library(googleComputeEngineR)
project <- "amplified-cat-180009"
zone <- "us-central1-a"
account_key <- "key.json"

Sys.setenv(GCE_AUTH_FILE = account_key,
           GCE_DEFAULT_PROJECT_ID = project,
           GCE_DEFAULT_ZONE = zone)

gce_auth()

gce_global_project(project)
gce_global_zone(zone)

default_project <- gce_get_project("amplified-cat-180009")
default_project$name

vm <- gce_vm(template = "rstudio",
             name = "rstudio-hackathon",
             username = "rstudio",
             password = "rstudio",
             predefined_type = "n1-highmem-8")
#n1-highmem-8
#n1-standard-8
#status <- gce_vm_stop("rstudio-demo")

gce_list_instances()
