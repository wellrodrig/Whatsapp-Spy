.class Lpl/droidsonroids/gif/PlaceholderDrawingSurfaceTextureListener;
.super Ljava/lang/Object;
.source "PlaceholderDrawingSurfaceTextureListener.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# instance fields
.field private final mDrawer:Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;


# direct methods
.method constructor <init>(Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;)V
    .locals 0
    .param p1, "drawer"    # Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lpl/droidsonroids/gif/PlaceholderDrawingSurfaceTextureListener;->mDrawer:Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;

    .line 13
    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 3
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 17
    new-instance v0, Landroid/view/Surface;

    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 18
    .local v0, "surface":Landroid/view/Surface;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v1

    .line 19
    .local v1, "canvas":Landroid/graphics/Canvas;
    iget-object v2, p0, Lpl/droidsonroids/gif/PlaceholderDrawingSurfaceTextureListener;->mDrawer:Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;

    invoke-interface {v2, v1}, Lpl/droidsonroids/gif/GifTextureView$PlaceholderDrawListener;->onDrawPlaceholder(Landroid/graphics/Canvas;)V

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 21
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 22
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .line 31
    const/4 v0, 0x0

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 27
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .line 37
    return-void
.end method
