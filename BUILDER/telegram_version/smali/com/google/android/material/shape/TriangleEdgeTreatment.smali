.class public Lcom/google/android/material/shape/TriangleEdgeTreatment;
.super Lcom/google/android/material/shape/EdgeTreatment;
.source "TriangleEdgeTreatment.java"


# instance fields
.field private final inside:Z

.field private final size:F


# direct methods
.method public constructor <init>(FZ)V
    .locals 0
    .param p1, "size"    # F
    .param p2, "inside"    # Z

    .line 42
    invoke-direct {p0}, Lcom/google/android/material/shape/EdgeTreatment;-><init>()V

    .line 43
    iput p1, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    .line 44
    iput-boolean p2, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->inside:Z

    .line 45
    return-void
.end method


# virtual methods
.method public getEdgePath(FFFLcom/google/android/material/shape/ShapePath;)V
    .locals 3
    .param p1, "length"    # F
    .param p2, "center"    # F
    .param p3, "interpolation"    # F
    .param p4, "shapePath"    # Lcom/google/android/material/shape/ShapePath;

    .line 50
    iget-boolean v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->inside:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 51
    iget v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    mul-float/2addr v0, p3

    sub-float v0, p2, v0

    invoke-virtual {p4, v0, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    .line 52
    iget v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    mul-float/2addr v0, p3

    iget v2, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    mul-float/2addr v2, p3

    add-float/2addr v2, p2

    invoke-virtual {p4, p2, v0, v2, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FFFF)V

    .line 53
    invoke-virtual {p4, p1, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    goto :goto_0

    .line 55
    :cond_0
    iget v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    mul-float/2addr v0, p3

    sub-float v0, p2, v0

    iget v2, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    neg-float v2, v2

    mul-float/2addr v2, p3

    invoke-virtual {p4, v0, v1, p2, v2}, Lcom/google/android/material/shape/ShapePath;->lineTo(FFFF)V

    .line 56
    iget v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    mul-float/2addr v0, p3

    add-float/2addr v0, p2

    invoke-virtual {p4, v0, v1, p1, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FFFF)V

    .line 58
    :goto_0
    return-void
.end method
