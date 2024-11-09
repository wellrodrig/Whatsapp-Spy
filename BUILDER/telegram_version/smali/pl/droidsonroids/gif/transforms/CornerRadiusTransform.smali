.class public Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;
.super Ljava/lang/Object;
.source "CornerRadiusTransform.java"

# interfaces
.implements Lpl/droidsonroids/gif/transforms/Transform;


# instance fields
.field private mCornerRadius:F

.field private final mDstRectF:Landroid/graphics/RectF;

.field private mShader:Landroid/graphics/Shader;


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .param p1, "cornerRadius"    # F

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    .line 28
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->setCornerRadiusSafely(F)V

    .line 29
    return-void
.end method

.method private setCornerRadiusSafely(F)V
    .locals 1
    .param p1, "cornerRadius"    # F

    .line 41
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 42
    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 43
    iput p1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method public getBounds()Landroid/graphics/RectF;
    .locals 1

    .line 63
    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getCornerRadius()F
    .locals 1

    .line 53
    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    return v0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .line 68
    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    .line 70
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "buffer"    # Landroid/graphics/Bitmap;

    .line 74
    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 75
    const/4 v0, 0x0

    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, p3, v0, v1, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 76
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    if-nez v0, :cond_1

    .line 79
    new-instance v0, Landroid/graphics/BitmapShader;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, p3, v1, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    .line 80
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 81
    .local v0, "shaderMatrix":Landroid/graphics/Matrix;
    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 82
    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 83
    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    invoke-virtual {v1, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 85
    .end local v0    # "shaderMatrix":Landroid/graphics/Matrix;
    :cond_1
    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 86
    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    iget v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    iget v2, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 87
    return-void
.end method

.method public setCornerRadius(F)V
    .locals 0
    .param p1, "cornerRadius"    # F

    .line 37
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->setCornerRadiusSafely(F)V

    .line 38
    return-void
.end method
