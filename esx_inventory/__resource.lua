resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"



description "ESX Inventory HUD with hotbar"



version "1.1"



ui_page "html/ui.html"



client_scripts {

  "@es_extended/locale.lua",

  "client/main.lua",

  "client/trunk.lua",

  "client/property.lua",

  "client/player.lua",

  "locales/cs.lua",

  "locales/en.lua",

  "locales/fr.lua",

  "config.lua"

}



server_scripts {

  "@mysql-async/lib/MySQL.lua",

  "@es_extended/locale.lua",

  "server/main.lua",

  "server/subMain.lua",
  
  "locales/cs.lua",

  "locales/en.lua",

  "locales/fr.lua",

  "config.lua"

}



files {

    "html/ui.html",

    "html/css/ui.css",

    "html/css/jquery-ui.css",

    "html/js/inventory.js",

    "html/js/config.js",

    -- JS LOCALES

    "html/locales/cs.js",

    "html/locales/en.js",

    "html/locales/fr.js",

    -- IMAGES

    "html/img/bullet.png",

    -- ICONS

    "html/img/items/*.png"



}

