.class public abstract Lpl/droidsonroids/gif/InputSource;
.super Ljava/lang/Object;
.source "InputSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/InputSource$AssetFileDescriptorSource;,
        Lpl/droidsonroids/gif/InputSource$ResourcesSource;,
        Lpl/droidsonroids/gif/InputSource$InputStreamSource;,
        Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;,
        Lpl/droidsonroids/gif/InputSource$AssetSource;,
        Lpl/droidsonroids/gif/InputSource$UriSource;,
        Lpl/droidsonroids/gif/InputSource$FileSource;,
        Lpl/droidsonroids/gif/InputSource$ByteArraySource;,
        Lpl/droidsonroids/gif/InputSource$DirectByteBufferSource;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method synthetic constructor <init>(Lpl/droidsonroids/gif/InputSource$1;)V
    .locals 0
    .param p1, "x0"    # Lpl/droidsonroids/gif/InputSource$1;

    .line 24
    invoke-direct {p0}, Lpl/droidsonroids/gif/InputSource;-><init>()V

    return-void
.end method


# virtual methods
.method final createGifDrawable(Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;ZLpl/droidsonroids/gif/GifOptions;)Lpl/droidsonroids/gif/GifDrawable;
    .locals 2
    .param p1, "oldDrawable"    # Lpl/droidsonroids/gif/GifDrawable;
    .param p2, "executor"    # Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .param p3, "isRenderingAlwaysEnabled"    # Z
    .param p4, "options"    # Lpl/droidsonroids/gif/GifOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    new-instance v0, Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {p0, p4}, Lpl/droidsonroids/gif/InputSource;->createHandleWith(Lpl/droidsonroids/gif/GifOptions;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2, p3}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    return-object v0
.end method

.method final createHandleWith(Lpl/droidsonroids/gif/GifOptions;)Lpl/droidsonroids/gif/GifInfoHandle;
    .locals 3
    .param p1, "options"    # Lpl/droidsonroids/gif/GifOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-virtual {p0}, Lpl/droidsonroids/gif/InputSource;->open()Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    .line 38
    .local v0, "handle":Lpl/droidsonroids/gif/GifInfoHandle;
    iget-char v1, p1, Lpl/droidsonroids/gif/GifOptions;->inSampleSize:C

    iget-boolean v2, p1, Lpl/droidsonroids/gif/GifOptions;->inIsOpaque:Z

    invoke-virtual {v0, v1, v2}, Lpl/droidsonroids/gif/GifInfoHandle;->setOptions(CZ)V

    .line 39
    return-object v0
.end method

.method abstract open()Lpl/droidsonroids/gif/GifInfoHandle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
