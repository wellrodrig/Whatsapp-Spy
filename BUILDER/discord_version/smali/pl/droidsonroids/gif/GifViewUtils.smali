.class final Lpl/droidsonroids/gif/GifViewUtils;
.super Ljava/lang/Object;
.source "GifViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;,
        Lpl/droidsonroids/gif/GifViewUtils$GifViewAttributes;
    }
.end annotation


# static fields
.field static final ANDROID_NS:Ljava/lang/String; = "http://schemas.android.com/apk/res/android"

.field static final SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 22
    const-string v0, "drawable"

    const-string v1, "mipmap"

    const-string v2, "raw"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lpl/droidsonroids/gif/GifViewUtils;->SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method static applyLoopCount(ILandroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p0, "loopCount"    # I
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 41
    instance-of v0, p1, Lpl/droidsonroids/gif/GifDrawable;

    if-eqz v0, :cond_0

    .line 42
    move-object v0, p1

    check-cast v0, Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v0, p0}, Lpl/droidsonroids/gif/GifDrawable;->setLoopCount(I)V

    .line 44
    :cond_0
    return-void
.end method

.method static getDensityScale(Landroid/content/res/Resources;I)F
    .locals 6
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I

    .line 82
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 83
    .local v0, "value":Landroid/util/TypedValue;
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 84
    iget v1, v0, Landroid/util/TypedValue;->density:I

    .line 86
    .local v1, "resourceDensity":I
    if-nez v1, :cond_0

    .line 87
    const/16 v2, 0xa0

    .local v2, "density":I
    goto :goto_0

    .line 88
    .end local v2    # "density":I
    :cond_0
    const v2, 0xffff

    if-eq v1, v2, :cond_1

    .line 89
    move v2, v1

    .restart local v2    # "density":I
    goto :goto_0

    .line 91
    .end local v2    # "density":I
    :cond_1
    const/4 v2, 0x0

    .line 93
    .restart local v2    # "density":I
    :goto_0
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 95
    .local v3, "targetDensity":I
    if-lez v2, :cond_2

    if-lez v3, :cond_2

    .line 96
    int-to-float v4, v3

    int-to-float v5, v2

    div-float/2addr v4, v5

    return v4

    .line 98
    :cond_2
    const/high16 v4, 0x3f800000    # 1.0f

    return v4
.end method

.method static initImageView(Landroid/widget/ImageView;Landroid/util/AttributeSet;II)Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;
    .locals 3
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .line 28
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 29
    new-instance v0, Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;

    invoke-direct {v0, p0, p1, p2, p3}, Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;-><init>(Landroid/widget/ImageView;Landroid/util/AttributeSet;II)V

    .line 30
    .local v0, "viewAttributes":Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;
    iget v1, v0, Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;->mLoopCount:I

    .line 31
    .local v1, "loopCount":I
    if-ltz v1, :cond_0

    .line 32
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v1, v2}, Lpl/droidsonroids/gif/GifViewUtils;->applyLoopCount(ILandroid/graphics/drawable/Drawable;)V

    .line 33
    invoke-virtual {p0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v1, v2}, Lpl/droidsonroids/gif/GifViewUtils;->applyLoopCount(ILandroid/graphics/drawable/Drawable;)V

    .line 35
    :cond_0
    return-object v0

    .line 37
    .end local v0    # "viewAttributes":Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;
    .end local v1    # "loopCount":I
    :cond_1
    new-instance v0, Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;

    invoke-direct {v0}, Lpl/droidsonroids/gif/GifViewUtils$GifImageViewAttributes;-><init>()V

    return-object v0
.end method

.method static setGifImageUri(Landroid/widget/ImageView;Landroid/net/Uri;)Z
    .locals 2
    .param p0, "imageView"    # Landroid/widget/ImageView;
    .param p1, "uri"    # Landroid/net/Uri;

    .line 70
    if-eqz p1, :cond_0

    .line 72
    :try_start_0
    new-instance v0, Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    const/4 v0, 0x1

    return v0

    .line 74
    :catch_0
    move-exception v0

    .line 78
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method static setResource(Landroid/widget/ImageView;ZI)Z
    .locals 4
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "isSrc"    # Z
    .param p2, "resId"    # I

    .line 48
    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 49
    .local v0, "res":Landroid/content/res/Resources;
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 51
    :try_start_0
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "resourceTypeName":Ljava/lang/String;
    sget-object v3, Lpl/droidsonroids/gif/GifViewUtils;->SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 53
    return v1

    .line 55
    :cond_0
    new-instance v3, Lpl/droidsonroids/gif/GifDrawable;

    invoke-direct {v3, v0, p2}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/Resources;I)V

    .line 56
    .local v3, "d":Lpl/droidsonroids/gif/GifDrawable;
    if-eqz p1, :cond_1

    .line 57
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 62
    .end local v2    # "resourceTypeName":Ljava/lang/String;
    .end local v3    # "d":Lpl/droidsonroids/gif/GifDrawable;
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    .line 66
    :cond_2
    :goto_1
    return v1
.end method
