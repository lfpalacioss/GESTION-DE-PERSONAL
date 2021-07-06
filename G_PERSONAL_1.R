# ########################################################### #
# ########  MONITOREO DE LOS AVANCES DE LA BD IGA's  ######## #
# #########################  BY LF  ######################### #
# ########################################################### #


## ######################## ###
##     I) SETEO GENERAL     ####
## ######################## ###

# BORRAR TODO LO ANTERIOR
rm(list=ls())

# INFO DEL USUARIO
USER=Sys.info()
USER=USER[7]

# SETEO DEL WD
# setwd(paste('C:/Users/',USER,'/Google Drive/4) R/2) BD/1) OEFA/2) IGAs',sep = ""))

# CARGANDO ARCHIVO BASE
source(paste('C:/Users/',USER,'/Google Drive/4) R/1) Scripts/0) SCRIPT BASE/BASE_LF.R',sep = ""))

# CARGAR LA LIBRER?A PARA ORACLE
# library(RJDBC)

# OTRAS LIB
# library(profvis)


###############################




## ######################## ###
##     I) LEER BD EXCEL     ####
## ######################## ###

# LEER PARA TRABAJAR BD 1
BD_1 = read_excel("BD_PERSONAL.xlsx") %>% 
  subset(select=c("DNI", 
                  "CODIGO SIA", 
                  "DOMICILIO SIA", 
                  "CODIGO DE PLAZA MEF", 
                  "SEDE",
                  "DEPARTAMENTO SEDE",
                  "PROVINCIA SEDE",
                  "DISTRITO SEDE",
                  "DIRECCIÓN / OFICINA PRINCIPAL",
                  "PISO",
                  "ANEXO",
                  ))


# LEER PARA TRABAJAR BD 1
BD_2 = read_excel("BD_PERSONAL.xlsx") %>% 
  subset(select=c("DNI", 
                  "CODIGO SIA", 
                  "DOMICILIO SIA", 
                  "CODIGO DE PLAZA MEF", 
                  "SEDE",
                  "DEPARTAMENTO SEDE",
                  "PROVINCIA SEDE",
                  "DISTRITO SEDE",
                  "DIRECCIÓN / OFICINA PRINCIPAL",
                  "PISO",
                  "ANEXO",
  ))

# LEER PARA TRABAJAR BD 1
BD_4 = read_excel("BD_PERSONAL.xlsx") %>% 
  subset(select=c("DNI", 
                  "NIVEL DE ESTUDIO (ESTUDIOS, EGRESADO, BACHILLER, TITULADO)", 
                  "NIVEL DE MAESTRÍA O DOCTORADO (ESTUDIOS, CONCLUÍDO, MAGISTER O DOCTOR, ETC.)", 
                  "CENTRO DE FORMACIÓN PROFESIONAL (UNIVERSIDAD, INSTITUTO)", 
                  "CENTRO DE FORMACIÓN POST GRADO",
                  "NOMBRE DE LA MAESTRÍA O DOCTORADO")) %>% 
  gather(TIPO_DE_ESTUDIO, ESTUDIO, 2:3) %>% 
  mutate(TIPO_DE_ESTUDIO=case_when(ESTUDIO=="TITULO TECNICO EGRESADO" ~ "TECNICO",
                                   ESTUDIO=="TITULO TECNICO"~"",
                                   ESTUDIO=="TITULDO"&(str_detect("CENTRO DE FORMACIÓN PROFESIONAL (UNIVERSIDAD, INSTITUTO)", "(?i)UNIVERS")==T) ~ "UNIVERSITARIO",
                                   TRUE~""))


                            



###############################