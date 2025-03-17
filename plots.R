EGsofmodule <- function(KE,module_number,exp){
  # for ëxperiment options are "uploadFile1_GENTAMYCINluhumanrptectert1" or "uploadFile1_GENTAMYCINvuhumanipscptlc"  
  module_table = read.delim(paste0(data_folder, '/moduleTable.txt'))
  KEs = module_table %>% dplyr::filter(module == paste0('hRPTECTERT1_', module_number), experiment == exp)
  ggplot(data = KEs) + geom_point(aes(conc_level, eg_score)) +
    geom_line(aes(conc_level, eg_score)) + 
    facet_wrap(~time) + 
    theme_classic() + 
    labs(title = paste0('EGs of module ',module_number,', KE:',KE), x = "Concentration (uM)", y = "EGs")
}