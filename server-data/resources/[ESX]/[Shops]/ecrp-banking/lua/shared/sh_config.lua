SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 7 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks"] = { -- what ranks can see the society accounts in the menu, and deposit/withdraw/transfer from them?
    -- ["boss"] = true,
    -- ["owner"] = true,
     -- Add additionals like I have here, don't forget the comma. Job rank must be lowercase!
}


SimpleBanking.Config["business_ranks_overrides"] = {
    ["mechanic"] = { -- If you want a certain company to use custom job ranks, add them like below. otherwise, it defaults back to business_ranks
        ["boss"] = true,
    },
    ["bcso"] = { -- If you want a certain company to use custom job ranks, add them like below. otherwise, it defaults back to business_ranks
        ["sheriff"] = true,
        ["underSheriff"] = true,
    }
}
