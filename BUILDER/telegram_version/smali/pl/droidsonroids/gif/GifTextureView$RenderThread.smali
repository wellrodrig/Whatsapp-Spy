.class Lpl/droidsonroids/gif/GifTextureView$RenderThread;
.super Ljava/lang/Thread;
.source "GifTextureView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/droidsonroids/gif/GifTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RenderThread"
.end annotation


# instance fields
.field final isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

.field private mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

.field private final mGifTextureViewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lpl/droidsonroids/gif/GifTextureView;",
            ">;"
        }
    .end annotation
.end field

.field private mIOException:Ljava/io/IOException;

.field mSavedState:[J


# direct methods
.method constructor <init>(Lpl/droidsonroids/gif/GifTextureView;)V
    .locals 1
    .param p1, "gifTextureView"    # Lpl/droidsonroids/gif/GifTextureView;

    .line 177
    const-string v0, "GifRenderThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 170
    new-instance v0, Lpl/droidsonroids/gif/ConditionVariable;

    invoke-direct {v0}, Lpl/droidsonroids/gif/ConditionVariable;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    .line 171
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-direct {v0}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 178
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    .line 179
    return-void
.end method

.method static synthetic access$300(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;
    .locals 1
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .line 168
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    return-object v0
.end method

.method static synthetic access$600(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Ljava/io/IOException;
    .locals 1
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .line 168
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mIOException:Ljava/io/IOException;

    return-object v0
.end method


# virtual methods
.method dispose(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;)V
    .locals 2
    .param p1, "gifTextureView"    # Lpl/droidsonroids/gif/GifTextureView;
    .param p2, "drawer"    # Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;

    .line 271
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/ConditionVariable;->close()V

    .line 273
    if-eqz p2, :cond_0

    new-instance v0, Lpl/droidsonroids/gif/PlaceholderDrawingSurfaceTextureListener;

    invoke-direct {v0, p2}, Lpl/droidsonroids/gif/PlaceholderDrawingSurfaceTextureListener;-><init>(Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 274
    .local v0, "listener":Landroid/view/TextureView$SurfaceTextureListener;
    :goto_0
    invoke-static {p1, v0}, Lpl/droidsonroids/gif/GifTextureView;->access$200(Lpl/droidsonroids/gif/GifTextureView;Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 275
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->postUnbindSurface()V

    .line 276
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->interrupt()V

    .line 277
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 245
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpl/droidsonroids/gif/GifTextureView;

    .line 246
    .local v0, "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-eqz v0, :cond_0

    .line 247
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifTextureView;->access$400(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 249
    :cond_0
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/ConditionVariable;->open()V

    .line 250
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .line 259
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/ConditionVariable;->close()V

    .line 260
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->postUnbindSurface()V

    .line 261
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->interrupt()V

    .line 262
    const/4 v0, 0x1

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 255
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .line 268
    return-void
.end method

.method public run()V
    .locals 7

    .line 184
    :try_start_0
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpl/droidsonroids/gif/GifTextureView;

    .line 185
    .local v0, "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-nez v0, :cond_0

    .line 186
    return-void

    .line 188
    :cond_0
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView;->access$000(Lpl/droidsonroids/gif/GifTextureView;)Lpl/droidsonroids/gif/InputSource;

    move-result-object v1

    invoke-virtual {v1}, Lpl/droidsonroids/gif/InputSource;->open()Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v1

    iput-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 189
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifTextureView;->isOpaque()Z

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Lpl/droidsonroids/gif/GifInfoHandle;->setOptions(CZ)V

    .line 190
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView;->access$100(Lpl/droidsonroids/gif/GifTextureView;)Lpl/droidsonroids/gif/GifViewUtils$GifViewAttributes;

    move-result-object v1

    iget v1, v1, Lpl/droidsonroids/gif/GifViewUtils$GifViewAttributes;->mLoopCount:I

    if-ltz v1, :cond_1

    .line 191
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView;->access$100(Lpl/droidsonroids/gif/GifTextureView;)Lpl/droidsonroids/gif/GifViewUtils$GifViewAttributes;

    move-result-object v2

    iget v2, v2, Lpl/droidsonroids/gif/GifViewUtils$GifViewAttributes;->mLoopCount:I

    invoke-virtual {v1, v2}, Lpl/droidsonroids/gif/GifInfoHandle;->setLoopCount(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 196
    .end local v0    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    :cond_1
    nop

    .line 198
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpl/droidsonroids/gif/GifTextureView;

    .line 199
    .restart local v0    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-nez v0, :cond_2

    .line 200
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    .line 201
    return-void

    .line 204
    :cond_2
    invoke-static {v0, p0}, Lpl/droidsonroids/gif/GifTextureView;->access$200(Lpl/droidsonroids/gif/GifTextureView;Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 205
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifTextureView;->isAvailable()Z

    move-result v1

    .line 206
    .local v1, "isSurfaceAvailable":Z
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v2, v1}, Lpl/droidsonroids/gif/ConditionVariable;->set(Z)V

    .line 207
    if-eqz v1, :cond_3

    .line 208
    new-instance v2, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;

    invoke-direct {v2, p0, v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;-><init>(Lpl/droidsonroids/gif/GifTextureView$RenderThread;Lpl/droidsonroids/gif/GifTextureView;)V

    invoke-virtual {v0, v2}, Lpl/droidsonroids/gif/GifTextureView;->post(Ljava/lang/Runnable;)Z

    .line 215
    :cond_3
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView;->access$500(Lpl/droidsonroids/gif/GifTextureView;)F

    move-result v3

    invoke-virtual {v2, v3}, Lpl/droidsonroids/gif/GifInfoHandle;->setSpeedFactor(F)V

    .line 217
    :goto_0
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_6

    .line 219
    :try_start_1
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/ConditionVariable;->block()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 223
    nop

    .line 224
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/GifTextureView;

    .line 225
    .local v2, "currentGifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-nez v2, :cond_4

    .line 226
    goto :goto_1

    .line 228
    :cond_4
    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v3

    .line 229
    .local v3, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    if-nez v3, :cond_5

    .line 230
    goto :goto_0

    .line 232
    :cond_5
    new-instance v4, Landroid/view/Surface;

    invoke-direct {v4, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 234
    .local v4, "surface":Landroid/view/Surface;
    :try_start_2
    iget-object v5, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mSavedState:[J

    invoke-virtual {v5, v4, v6}, Lpl/droidsonroids/gif/GifInfoHandle;->bindSurface(Landroid/view/Surface;[J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 236
    invoke-virtual {v4}, Landroid/view/Surface;->release()V

    .line 237
    nop

    .line 238
    .end local v2    # "currentGifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    .end local v3    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    .end local v4    # "surface":Landroid/view/Surface;
    goto :goto_0

    .line 236
    .restart local v2    # "currentGifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    .restart local v3    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    .restart local v4    # "surface":Landroid/view/Surface;
    :catchall_0
    move-exception v5

    invoke-virtual {v4}, Landroid/view/Surface;->release()V

    .line 237
    throw v5

    .line 220
    .end local v2    # "currentGifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    .end local v3    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    .end local v4    # "surface":Landroid/view/Surface;
    :catch_0
    move-exception v2

    .line 221
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 222
    nop

    .line 239
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :cond_6
    :goto_1
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    .line 240
    new-instance v2, Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-direct {v2}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>()V

    iput-object v2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 241
    return-void

    .line 193
    .end local v0    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    .end local v1    # "isSurfaceAvailable":Z
    :catch_1
    move-exception v0

    .line 194
    .local v0, "ex":Ljava/io/IOException;
    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mIOException:Ljava/io/IOException;

    .line 195
    return-void
.end method
