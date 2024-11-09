.class Lpl/droidsonroids/gif/RenderTask;
.super Lpl/droidsonroids/gif/SafeRunnable;
.source "RenderTask.java"


# direct methods
.method constructor <init>(Lpl/droidsonroids/gif/GifDrawable;)V
    .locals 0
    .param p1, "gifDrawable"    # Lpl/droidsonroids/gif/GifDrawable;

    .line 12
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/SafeRunnable;-><init>(Lpl/droidsonroids/gif/GifDrawable;)V

    .line 13
    return-void
.end method


# virtual methods
.method public doWork()V
    .locals 8

    .line 17
    iget-object v0, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v0, v0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    iget-object v1, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v1, v1, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->renderFrame(Landroid/graphics/Bitmap;)J

    move-result-wide v0

    .line 18
    .local v0, "invalidationDelay":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_1

    .line 19
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    add-long/2addr v5, v0

    iput-wide v5, v4, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    .line 20
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifDrawable;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-boolean v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    if-eqz v4, :cond_0

    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-boolean v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mIsRenderingTriggeredOnDraw:Z

    if-nez v4, :cond_0

    .line 21
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v4, p0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    .line 22
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v5, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v5, v5, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5, p0, v0, v1, v6}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v5

    iput-object v5, v4, Lpl/droidsonroids/gif/GifDrawable;->mRenderTaskSchedule:Ljava/util/concurrent/ScheduledFuture;

    .line 24
    :cond_0
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifDrawable;->getCurrentFrameIndex()I

    move-result v4

    iget-object v5, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v5, v5, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v5}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v4, v5, :cond_2

    .line 25
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    iget-object v5, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v5}, Lpl/droidsonroids/gif/GifDrawable;->getCurrentLoop()I

    move-result v5

    iget-object v6, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-wide v6, v6, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    invoke-virtual {v4, v5, v6, v7}, Lpl/droidsonroids/gif/InvalidationHandler;->sendEmptyMessageAtTime(IJ)Z

    goto :goto_0

    .line 28
    :cond_1
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    const-wide/high16 v5, -0x8000000000000000L

    iput-wide v5, v4, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    .line 29
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    const/4 v5, 0x0

    iput-boolean v5, v4, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    .line 31
    :cond_2
    :goto_0
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifDrawable;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Lpl/droidsonroids/gif/InvalidationHandler;->hasMessages(I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 32
    iget-object v4, p0, Lpl/droidsonroids/gif/RenderTask;->mGifDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v4, v4, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    invoke-virtual {v4, v5, v2, v3}, Lpl/droidsonroids/gif/InvalidationHandler;->sendEmptyMessageAtTime(IJ)Z

    .line 34
    :cond_3
    return-void
.end method
