.class public final Lcom/google/android/material/color/utilities/ViewingConditions;
.super Ljava/lang/Object;
.source "ViewingConditions.java"


# static fields
.field public static final DEFAULT:Lcom/google/android/material/color/utilities/ViewingConditions;


# instance fields
.field private final aw:D

.field private final c:D

.field private final fl:D

.field private final flRoot:D

.field private final n:D

.field private final nbb:D

.field private final nc:D

.field private final ncb:D

.field private final rgbD:[D

.field private final z:D


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 39
    nop

    .line 42
    invoke-static {}, Lcom/google/android/material/color/utilities/ColorUtils;->whitePointD65()[D

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v2, v0, v1

    .line 43
    invoke-static {}, Lcom/google/android/material/color/utilities/ColorUtils;->whitePointD65()[D

    move-result-object v0

    const/4 v4, 0x1

    aget-wide v5, v0, v4

    .line 44
    invoke-static {}, Lcom/google/android/material/color/utilities/ColorUtils;->whitePointD65()[D

    move-result-object v0

    const/4 v7, 0x2

    aget-wide v8, v0, v7

    const/4 v0, 0x3

    new-array v10, v0, [D

    aput-wide v2, v10, v1

    aput-wide v5, v10, v4

    aput-wide v8, v10, v7

    .line 46
    const-wide/high16 v0, 0x4049000000000000L    # 50.0

    invoke-static {v0, v1}, Lcom/google/android/material/color/utilities/ColorUtils;->yFromLstar(D)D

    move-result-wide v0

    const-wide v2, 0x404fd4bbab8b494cL    # 63.66197723675813

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    div-double v11, v0, v2

    .line 40
    const-wide/high16 v13, 0x4049000000000000L    # 50.0

    const-wide/high16 v15, 0x4000000000000000L    # 2.0

    const/16 v17, 0x0

    invoke-static/range {v10 .. v17}, Lcom/google/android/material/color/utilities/ViewingConditions;->make([DDDDZ)Lcom/google/android/material/color/utilities/ViewingConditions;

    move-result-object v0

    sput-object v0, Lcom/google/android/material/color/utilities/ViewingConditions;->DEFAULT:Lcom/google/android/material/color/utilities/ViewingConditions;

    .line 39
    return-void
.end method

.method private constructor <init>(DDDDDD[DDDD)V
    .locals 16
    .param p1, "n"    # D
    .param p3, "aw"    # D
    .param p5, "nbb"    # D
    .param p7, "ncb"    # D
    .param p9, "c"    # D
    .param p11, "nc"    # D
    .param p13, "rgbD"    # [D
    .param p14, "fl"    # D
    .param p16, "flRoot"    # D
    .param p18, "z"    # D

    .line 189
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 190
    move-wide/from16 v1, p1

    iput-wide v1, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->n:D

    .line 191
    move-wide/from16 v3, p3

    iput-wide v3, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->aw:D

    .line 192
    move-wide/from16 v5, p5

    iput-wide v5, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->nbb:D

    .line 193
    move-wide/from16 v7, p7

    iput-wide v7, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->ncb:D

    .line 194
    move-wide/from16 v9, p9

    iput-wide v9, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->c:D

    .line 195
    move-wide/from16 v11, p11

    iput-wide v11, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->nc:D

    .line 196
    move-object/from16 v13, p13

    iput-object v13, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->rgbD:[D

    .line 197
    move-wide/from16 v14, p14

    iput-wide v14, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->fl:D

    .line 198
    move-wide/from16 v1, p16

    iput-wide v1, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->flRoot:D

    .line 199
    move-wide/from16 v1, p18

    iput-wide v1, v0, Lcom/google/android/material/color/utilities/ViewingConditions;->z:D

    .line 200
    return-void
.end method

.method static make([DDDDZ)Lcom/google/android/material/color/utilities/ViewingConditions;
    .locals 62
    .param p0, "whitePoint"    # [D
    .param p1, "adaptingLuminance"    # D
    .param p3, "backgroundLstar"    # D
    .param p5, "surround"    # D
    .param p7, "discountingIlluminant"    # Z

    .line 127
    move-wide/from16 v0, p1

    sget-object v2, Lcom/google/android/material/color/utilities/Cam16;->XYZ_TO_CAM16RGB:[[D

    .line 128
    .local v2, "matrix":[[D
    move-object/from16 v3, p0

    .line 129
    .local v3, "xyz":[D
    const/4 v4, 0x0

    aget-wide v5, v3, v4

    aget-object v7, v2, v4

    aget-wide v8, v7, v4

    mul-double/2addr v5, v8

    const/4 v7, 0x1

    aget-wide v8, v3, v7

    aget-object v10, v2, v4

    aget-wide v11, v10, v7

    mul-double/2addr v8, v11

    add-double/2addr v5, v8

    const/4 v8, 0x2

    aget-wide v9, v3, v8

    aget-object v11, v2, v4

    aget-wide v12, v11, v8

    mul-double/2addr v9, v12

    add-double/2addr v5, v9

    .line 130
    .local v5, "rW":D
    aget-wide v9, v3, v4

    aget-object v11, v2, v7

    aget-wide v12, v11, v4

    mul-double/2addr v9, v12

    aget-wide v11, v3, v7

    aget-object v13, v2, v7

    aget-wide v14, v13, v7

    mul-double/2addr v11, v14

    add-double/2addr v9, v11

    aget-wide v11, v3, v8

    aget-object v13, v2, v7

    aget-wide v14, v13, v8

    mul-double/2addr v11, v14

    add-double/2addr v9, v11

    .line 131
    .local v9, "gW":D
    aget-wide v11, v3, v4

    aget-object v13, v2, v8

    aget-wide v14, v13, v4

    mul-double/2addr v11, v14

    aget-wide v13, v3, v7

    aget-object v15, v2, v8

    aget-wide v16, v15, v7

    mul-double v13, v13, v16

    add-double/2addr v11, v13

    aget-wide v13, v3, v8

    aget-object v15, v2, v8

    aget-wide v16, v15, v8

    mul-double v13, v13, v16

    add-double/2addr v11, v13

    .line 132
    .local v11, "bW":D
    const-wide/high16 v13, 0x4024000000000000L    # 10.0

    div-double v15, p5, v13

    const-wide v17, 0x3fe999999999999aL    # 0.8

    add-double v15, v15, v17

    .line 134
    .local v15, "f":D
    const-wide v19, 0x3feccccccccccccdL    # 0.9

    cmpl-double v21, v15, v19

    if-ltz v21, :cond_0

    .line 135
    sub-double v17, v15, v19

    mul-double v23, v17, v13

    const-wide v19, 0x3fe2e147ae147ae1L    # 0.59

    const-wide v21, 0x3fe6147ae147ae14L    # 0.69

    invoke-static/range {v19 .. v24}, Lcom/google/android/material/color/utilities/MathUtils;->lerp(DDD)D

    move-result-wide v13

    move-wide/from16 v28, v13

    goto :goto_0

    .line 136
    :cond_0
    sub-double v17, v15, v17

    mul-double v23, v17, v13

    const-wide v19, 0x3fe0cccccccccccdL    # 0.525

    const-wide v21, 0x3fe2e147ae147ae1L    # 0.59

    invoke-static/range {v19 .. v24}, Lcom/google/android/material/color/utilities/MathUtils;->lerp(DDD)D

    move-result-wide v13

    move-wide/from16 v28, v13

    :goto_0
    nop

    .line 138
    .local v28, "c":D
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    if-eqz p7, :cond_1

    .line 139
    move-wide/from16 v23, v13

    goto :goto_1

    .line 140
    :cond_1
    neg-double v7, v0

    const-wide/high16 v19, 0x4045000000000000L    # 42.0

    sub-double v7, v7, v19

    const-wide/high16 v19, 0x4057000000000000L    # 92.0

    div-double v7, v7, v19

    invoke-static {v7, v8}, Ljava/lang/Math;->exp(D)D

    move-result-wide v7

    const-wide v19, 0x3fd1c71c71c71c72L    # 0.2777777777777778

    mul-double v7, v7, v19

    sub-double v7, v13, v7

    mul-double/2addr v7, v15

    move-wide/from16 v23, v7

    :goto_1
    nop

    .line 141
    .local v23, "d":D
    const-wide/16 v19, 0x0

    const-wide/high16 v21, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v19 .. v24}, Lcom/google/android/material/color/utilities/MathUtils;->clampDouble(DDD)D

    move-result-wide v7

    .line 142
    .end local v23    # "d":D
    .local v7, "d":D
    move-wide/from16 v30, v15

    .line 143
    .local v30, "nc":D
    const-wide/high16 v22, 0x4059000000000000L    # 100.0

    div-double v19, v22, v5

    mul-double v19, v19, v7

    add-double v19, v19, v13

    sub-double v19, v19, v7

    div-double v24, v22, v9

    mul-double v24, v24, v7

    add-double v24, v24, v13

    sub-double v24, v24, v7

    div-double v26, v22, v11

    mul-double v26, v26, v7

    add-double v26, v26, v13

    sub-double v26, v26, v7

    const/4 v13, 0x3

    new-array v14, v13, [D

    aput-wide v19, v14, v4

    const/16 v17, 0x1

    aput-wide v24, v14, v17

    const/16 v18, 0x2

    aput-wide v26, v14, v18

    .local v14, "rgbD":[D
    move-object/from16 v32, v14

    .line 147
    const-wide/high16 v19, 0x4014000000000000L    # 5.0

    mul-double v24, v0, v19

    const-wide/high16 v26, 0x3ff0000000000000L    # 1.0

    add-double v24, v24, v26

    div-double v39, v26, v24

    .line 148
    .local v39, "k":D
    mul-double v24, v39, v39

    mul-double v24, v24, v39

    mul-double v41, v24, v39

    .line 149
    .local v41, "k4":D
    sub-double v43, v26, v41

    .line 150
    .local v43, "k4F":D
    mul-double v24, v41, v0

    const-wide v26, 0x3fb999999999999aL    # 0.1

    mul-double v26, v26, v43

    mul-double v26, v26, v43

    mul-double v19, v19, v0

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v19

    mul-double v26, v26, v19

    move-wide/from16 v45, v5

    .end local v5    # "rW":D
    .local v45, "rW":D
    add-double v4, v24, v26

    .local v4, "fl":D
    move-wide/from16 v33, v4

    .line 151
    invoke-static/range {p3 .. p4}, Lcom/google/android/material/color/utilities/ColorUtils;->yFromLstar(D)D

    move-result-wide v20

    const/4 v6, 0x1

    aget-wide v24, p0, v6

    move-object/from16 v47, v14

    .end local v14    # "rgbD":[D
    .local v47, "rgbD":[D
    div-double v13, v20, v24

    .local v13, "n":D
    move-wide/from16 v20, v13

    .line 152
    const-wide v24, 0x3ff7ae147ae147aeL    # 1.48

    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v26

    add-double v48, v26, v24

    .local v48, "z":D
    move-wide/from16 v37, v48

    .line 153
    move-wide/from16 v50, v7

    .end local v7    # "d":D
    .local v50, "d":D
    const-wide v6, 0x3fc999999999999aL    # 0.2

    invoke-static {v13, v14, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    const-wide v24, 0x3fe7333333333333L    # 0.725

    div-double v52, v24, v6

    .local v52, "nbb":D
    move-wide/from16 v24, v52

    .line 154
    move-wide/from16 v26, v52

    .line 155
    .local v26, "ncb":D
    const/4 v6, 0x0

    aget-wide v35, v47, v6

    mul-double v35, v35, v4

    mul-double v35, v35, v45

    div-double v6, v35, v22

    .line 157
    move-wide/from16 v54, v9

    .end local v9    # "gW":D
    .local v54, "gW":D
    const-wide v8, 0x3fdae147ae147ae1L    # 0.42

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v35

    const/4 v6, 0x1

    aget-wide v56, v47, v6

    mul-double v56, v56, v4

    mul-double v56, v56, v54

    div-double v6, v56, v22

    .line 158
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v56

    const/4 v7, 0x2

    aget-wide v58, v47, v7

    mul-double v58, v58, v4

    mul-double v58, v58, v11

    move-wide/from16 v60, v11

    .end local v11    # "bW":D
    .local v60, "bW":D
    div-double v10, v58, v22

    .line 159
    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    const/4 v6, 0x3

    new-array v10, v6, [D

    const/4 v11, 0x0

    aput-wide v35, v10, v11

    const/4 v12, 0x1

    aput-wide v56, v10, v12

    aput-wide v8, v10, v7

    move-object v7, v10

    .line 162
    .local v7, "rgbAFactors":[D
    aget-wide v8, v7, v11

    const-wide/high16 v22, 0x4079000000000000L    # 400.0

    mul-double v8, v8, v22

    aget-wide v35, v7, v11

    const-wide v10, 0x403b2147ae147ae1L    # 27.13

    add-double v35, v35, v10

    div-double v8, v8, v35

    aget-wide v35, v7, v12

    mul-double v35, v35, v22

    aget-wide v56, v7, v12

    add-double v56, v56, v10

    div-double v35, v35, v56

    const/16 v17, 0x2

    aget-wide v56, v7, v17

    mul-double v56, v56, v22

    aget-wide v22, v7, v17

    add-double v22, v22, v10

    div-double v56, v56, v22

    const/4 v6, 0x3

    new-array v6, v6, [D

    const/4 v10, 0x0

    aput-wide v8, v6, v10

    aput-wide v35, v6, v12

    aput-wide v56, v6, v17

    .line 169
    .local v6, "rgbA":[D
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    aget-wide v10, v6, v10

    mul-double/2addr v10, v8

    aget-wide v8, v6, v12

    add-double/2addr v10, v8

    const-wide v8, 0x3fa999999999999aL    # 0.05

    aget-wide v17, v6, v17

    mul-double v17, v17, v8

    add-double v10, v10, v17

    mul-double v10, v10, v52

    .local v10, "aw":D
    move-wide/from16 v22, v10

    .line 170
    new-instance v8, Lcom/google/android/material/color/utilities/ViewingConditions;

    move-object/from16 v19, v8

    const-wide/high16 v0, 0x3fd0000000000000L    # 0.25

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v35

    invoke-direct/range {v19 .. v38}, Lcom/google/android/material/color/utilities/ViewingConditions;-><init>(DDDDDD[DDDD)V

    return-object v8
.end method


# virtual methods
.method public getAw()D
    .locals 2

    .line 63
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->aw:D

    return-wide v0
.end method

.method getC()D
    .locals 2

    .line 79
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->c:D

    return-wide v0
.end method

.method getFl()D
    .locals 2

    .line 91
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->fl:D

    return-wide v0
.end method

.method public getFlRoot()D
    .locals 2

    .line 95
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->flRoot:D

    return-wide v0
.end method

.method public getN()D
    .locals 2

    .line 67
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->n:D

    return-wide v0
.end method

.method public getNbb()D
    .locals 2

    .line 71
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->nbb:D

    return-wide v0
.end method

.method getNc()D
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->nc:D

    return-wide v0
.end method

.method getNcb()D
    .locals 2

    .line 75
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->ncb:D

    return-wide v0
.end method

.method public getRgbD()[D
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->rgbD:[D

    return-object v0
.end method

.method getZ()D
    .locals 2

    .line 99
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->z:D

    return-wide v0
.end method
