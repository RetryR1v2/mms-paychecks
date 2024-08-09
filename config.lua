Config = {}

Config.defaultlang = "de_lang"

-- Webhook Settings

Config.WebHook = true

Config.WHTitle = 'Paycheck:'
Config.WHLink = ''  -- Discord WH link Here
Config.WHColor = 16711680 -- red
Config.WHName = 'Paycheck:' -- name
Config.WHLogo = '' -- must be 30x30px
Config.WHFooterLogo = '' -- must be 30x30px
Config.WHAvatar = '' -- must be 30x30px

---------------------- Paycheck Settings ------------------

Config.UseCustomMessage = true

Config.Jobs = {
    {
        JobName = 'pr',  --- Job Name NOT LABLE Pfarrer und Gouverneur in Einem
        PaycheckTimer = 1800, -- 1800 Sec. Timer in Sec Every 30 Min the Payment is Done
        Grades = {
            {
                Grade = 1,   -- Grade/Rank 
                Payment = 50, -- Payment in $
                CustomMessage = 'Du hast dein Pfarrer Gehalt von 50$ erhalten.'
            },
        }
    },
    {
        JobName = 'unemployed',
        PaycheckTimer = 1800,
        Grades = {
            {
                Grade = 0,
                Payment = 15,
                CustomMessage = 'Du hast dein Arbeitslosengeld von 15$ erhalten.'
            },
        }
    },
}