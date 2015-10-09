settings  {
    logfile     = "/home/yoann/lsyncd/lsyncd.log",
    pidfile     = "/home/yoann/lsyncd/lsyncd.pid",
    statusFile  = "/home/yoann/lsyncd/lsyncd.status",
    statusInterval = 10,
    delay       = 1,
    nodaemon    = true,
    insist = true,
}


sync {
    default.rsync,
    source="/home/sites/awin-darwin",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/darwin.affiliatewindow.com",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"},
}

sync {
    default.rsync,
    source="/home/sites/awin-images",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/images.affiliatewindow",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}

sync {
    default.rsync,
    source="/home/sites/awin-localization",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/localization",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}


sync {
    default.rsync,
    source="/home/sites/awin-services",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/awin-services",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}


sync {
    default.rsync,
    source="/home/sites/awin-site2",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/site2",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}


sync {
    default.rsync,
    source="/home/sites/awin-voucherwindow",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/voucherwindow",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}

sync {
    default.rsync,
    source="/home/sites/awin-librarylegacy",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/library/PHP4",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}

sync {
    default.rsync,
    source="/home/sites/awin-reporting",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/reporting",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}

sync {
    default.rsync,
    source="/home/sites/awin-apishared",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/apiShared",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}

sync {
    default.rsync,
    source="/home/sites/awin-payments",
    target="admin@yoannr.dev.affiliatewindow.com:/home/sites/payment",
    rsync = {
        compress=false,
    },
    exclude={"*~",".git",".project","*.bak",".idea"}
}

