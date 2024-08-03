Config = {}

Config.defaultlang = "de_lang"

-- Webhook Settings

Config.WebHook = true

Config.WHTitle = 'Paycheck:'
Config.WHLink = 'https://discordapp.com/api/webhooks/1269410339959603262/JE7-i4Ds59KlNk2w_-V2TX3DRV4yirx5095LYf99FKg5kB0Ms-PWFxy5G3gY0P93bdZd'  -- Discord WH link Here
Config.WHColor = 16711680 -- red
Config.WHName = 'Paycheck:' -- name
Config.WHLogo = '' -- must be 30x30px
Config.WHFooterLogo = '' -- must be 30x30px
Config.WHAvatar = '' -- must be 30x30px

---------------------- Paycheck Settings ------------------


Config.Jobs = {
    {
        JobName = 'doktor',  --- Job Name NOT LABLE
        PaycheckTimer = 1800, -- 1800 Sec. Timer in Sec Every 30 Min the Payment is Done
        Grades = {
            {
                Grade = 1,   -- Grade/Rank 
                Payment = 10, -- Payment in $
            },
            {
                Grade = 2,
                Payment = 11,
            },
            {
                Grade = 3,
                Payment = 12,
            },
        }
    },
    {
        JobName = 'police',
        PaycheckTimer = 1800,
        Grades = {
            {
                Grade = 1,
                Payment = 10,
            },
            {
                Grade = 2,
                Payment = 11,
            },
            {
                Grade = 3,
                Payment = 12,
            },
        }
    },
}