.class public final Lpl/droidsonroids/gif/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/droidsonroids/gif/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static GifTextureView:[I = null

.field public static GifTextureView_gifSource:I = 0x0

.field public static GifTextureView_isOpaque:I = 0x1

.field public static GifView:[I = null

.field public static GifView_freezesAnimation:I = 0x0

.field public static GifView_loopCount:I = 0x1


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const v0, 0x7f0301cf

    const v1, 0x7f0301fe

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lpl/droidsonroids/gif/R$styleable;->GifTextureView:[I

    const v0, 0x7f0301cc

    const v1, 0x7f030281

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lpl/droidsonroids/gif/R$styleable;->GifView:[I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
