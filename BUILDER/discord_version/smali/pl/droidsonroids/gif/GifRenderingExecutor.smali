.class final Lpl/droidsonroids/gif/GifRenderingExecutor;
.super Ljava/util/concurrent/ScheduledThreadPoolExecutor;
.source "GifRenderingExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/GifRenderingExecutor$InstanceHolder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 21
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;

    invoke-direct {v0}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;-><init>()V

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/RejectedExecutionHandler;)V

    .line 22
    return-void
.end method

.method synthetic constructor <init>(Lpl/droidsonroids/gif/GifRenderingExecutor$1;)V
    .locals 0
    .param p1, "x0"    # Lpl/droidsonroids/gif/GifRenderingExecutor$1;

    .line 9
    invoke-direct {p0}, Lpl/droidsonroids/gif/GifRenderingExecutor;-><init>()V

    return-void
.end method

.method static getInstance()Lpl/droidsonroids/gif/GifRenderingExecutor;
    .locals 1

    .line 17
    invoke-static {}, Lpl/droidsonroids/gif/GifRenderingExecutor$InstanceHolder;->access$100()Lpl/droidsonroids/gif/GifRenderingExecutor;

    move-result-object v0

    return-object v0
.end method
