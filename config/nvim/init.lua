-- Set options for Python filetype                                        
vim.api.nvim_create_autocmd("FileType", {                                 
  pattern = "python",                                                     
  callback = function()                                                   
    vim.bo.tabstop = 4                                                    
    vim.bo.shiftwidth = 4                                                 
    vim.bo.expandtab = true                                               
  end,                                                                    
})                                                                        
                                                                          
-- Set global options                                                     
vim.o.mouse = ""                                                          
vim.o.tabstop = 4                                                         
vim.o.shiftwidth = 4                                                      
vim.o.expandtab = true                                                    
vim.o.colorcolumn = "80"                      
