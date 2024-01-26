Add the files and folders to the following paths:

`cex.html`
`cex.png`

- qs-smartphone/html/apps/cex.html
- qs-smartphone/html/img/apps/cex.png

> If your LuxuCEX folder has a diferent name, open cex.html and change `const resource` to the name of your folder.

Add the following in the corresponding lines:

config.lua

```
Config.PhoneApplications={
    ...,
        [18] = { -- App position, check that there is no other app in this position.
        custom = true, -- Run this if the app is custom.
        app = "cex", -- Name of the html file that we will create for the app.
        homebarColor = "#bd2e59", -- Color of the home bar.
        headcolor = "#bd2e59", -- Color of the head icons.
        color = "img/apps/cex.png", -- Image of the app.
        icon = "",
        tooltipText = "CEX", -- Choose the visual name of the app.
        job = false,
        slot = 18, -- App position, check that there is no other app in this position.
        blockedjobs = {},
        Alerts = 0,
        bottom = true
    },
}
```

```
Config.StoreApps = {
    -- Apps from the App Store.
    ["cex"] = {
        custom = true, -- Is custom app?
        app = "cex", -- App label.
        color = "img/apps/cex.png", -- App visual image.
        tooltipText = "CEX", -- Visual app name.
        tooltipPos = "top", -- Ignore.
        job = false, -- If you want this app to work only with jobs, put them inside ' '.
        blockedjobs = {}, -- If you want this app to crash with jobs, put them inside {}.
        slot = 18, -- Slot where the app will be installed.
        Alerts = 0, -- Ignore.
        creator = "Luxu.gg​",
        password = false,
        isGame = false,
        description = "Track,Trade and Transfer crypto!",
        score = "4.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "22.5M Ratings",
        age = "18+",
        extraDescription = {
            {
                header = "CEX",
                head = "Track,Trade and Transfer crypto!",
                image = "https://i.imgur.com/PKPBtLC.png",
                footer = "Bringing you closer to the people and things you love. — Instagram from Facebook",
                textcolor = 'white'
            }
        }
    },
    ...
}
```
