function Read-Character() {   
     if ($host.ui.RawUI.KeyAvailable) {      
           return $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").Character  
     }   
      return $null
}
