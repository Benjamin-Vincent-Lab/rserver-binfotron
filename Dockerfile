FROM benjaminvincentlab/rserver:3.6.1.4
# OS: Debian GNU/Linux 9 (stretch)


# Should move this before StarSalmon next time

RUN R -e "BiocManager::install('annotate')"
RUN R -e "BiocManager::install('org.Hs.eg.db')"
RUN R -e "devtools::install_github('vegandevs/vegan', ref = 'v2.5-3')" 
RUN R -e "devtools::install_github('benjamin-vincent-lab/housekeeping', ref = '0.2-00')" 
RUN R -e "devtools::install_github('benjamin-vincent-lab/binfotron', ref = '0.3-12')" 
RUN R -e "devtools::install_github('benjamin-vincent-lab/StarSalmon', ref = '0.1-04')" 

