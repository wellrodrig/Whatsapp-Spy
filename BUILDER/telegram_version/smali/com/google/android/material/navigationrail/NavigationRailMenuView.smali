.class public Lcom/google/android/material/navigationrail/NavigationRailMenuView;
.super Lcom/google/android/material/navigation/NavigationBarMenuView;
.source "NavigationRailMenuView.java"


# instance fields
.field private itemMinimumHeight:I

.field private final layoutParams:Landroid/widget/FrameLayout$LayoutParams;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 46
    invoke-direct {p0, p1}, Lcom/google/android/material/navigation/NavigationBarMenuView;-><init>(Landroid/content/Context;)V

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->itemMinimumHeight:I

    .line 42
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput-object v1, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    .line 48
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x31

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 49
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p0, v0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->setItemActiveIndicatorResizeable(Z)V

    .line 51
    return-void
.end method

.method private makeSharedHeightSpec(III)I
    .locals 4
    .param p1, "parentWidthSpec"    # I
    .param p2, "maxHeight"    # I
    .param p3, "shareCount"    # I

    .line 93
    const/4 v0, 0x1

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int v0, p2, v0

    .line 97
    .local v0, "maxAvailable":I
    iget v1, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->itemMinimumHeight:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 98
    iget v1, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->itemMinimumHeight:I

    goto :goto_0

    .line 99
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    :goto_0
    nop

    .line 100
    .local v1, "minHeight":I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    return v2
.end method

.method private measureChildHeight(Landroid/view/View;II)I
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "widthMeasureSpec"    # I
    .param p3, "heightMeasureSpec"    # I

    .line 144
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 145
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 146
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0

    .line 149
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private measureSharedChildHeights(IIILandroid/view/View;)I
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "maxHeight"    # I
    .param p3, "shareCount"    # I
    .param p4, "selectedView"    # Landroid/view/View;

    .line 121
    if-nez p4, :cond_0

    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->makeSharedHeightSpec(III)I

    move-result v0

    .local v0, "childHeightSpec":I
    goto :goto_0

    .line 127
    .end local v0    # "childHeightSpec":I
    :cond_0
    nop

    .line 128
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 131
    .restart local v0    # "childHeightSpec":I
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getChildCount()I

    move-result v1

    .line 132
    .local v1, "childCount":I
    const/4 v2, 0x0

    .line 133
    .local v2, "totalHeight":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_2

    .line 134
    invoke-virtual {p0, v3}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 135
    .local v4, "child":Landroid/view/View;
    if-eq v4, p4, :cond_1

    .line 136
    invoke-direct {p0, v4, p1, v0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->measureChildHeight(Landroid/view/View;II)I

    move-result v5

    add-int/2addr v2, v5

    .line 133
    .end local v4    # "child":Landroid/view/View;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 140
    .end local v3    # "i":I
    :cond_2
    return v2
.end method

.method private measureShiftingChildHeights(III)I
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "maxHeight"    # I
    .param p3, "shareCount"    # I

    .line 104
    const/4 v0, 0x0

    .line 106
    .local v0, "selectedViewHeight":I
    invoke-virtual {p0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 107
    .local v1, "selectedView":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 108
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->makeSharedHeightSpec(III)I

    move-result v2

    .line 109
    .local v2, "childHeightSpec":I
    invoke-direct {p0, v1, p1, v2}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->measureChildHeight(Landroid/view/View;II)I

    move-result v0

    .line 110
    sub-int/2addr p2, v0

    .line 111
    add-int/lit8 p3, p3, -0x1

    .line 114
    .end local v2    # "childHeightSpec":I
    :cond_0
    nop

    .line 115
    invoke-direct {p0, p1, p2, p3, v1}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->measureSharedChildHeights(IIILandroid/view/View;)I

    move-result v2

    add-int/2addr v2, v0

    .line 114
    return v2
.end method


# virtual methods
.method protected createNavigationBarItemView(Landroid/content/Context;)Lcom/google/android/material/navigation/NavigationBarItemView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 89
    new-instance v0, Lcom/google/android/material/navigationrail/NavigationRailItemView;

    invoke-direct {v0, p1}, Lcom/google/android/material/navigationrail/NavigationRailItemView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getItemMinimumHeight()I
    .locals 1

    .line 172
    iget v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->itemMinimumHeight:I

    return v0
.end method

.method getMenuGravity()I
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    return v0
.end method

.method isTopGravity()Z
    .locals 2

    .line 176
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v0, v0, 0x70

    const/16 v1, 0x30

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 73
    invoke-virtual {p0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getChildCount()I

    move-result v0

    .line 74
    .local v0, "count":I
    sub-int v1, p4, p2

    .line 75
    .local v1, "width":I
    const/4 v2, 0x0

    .line 76
    .local v2, "used":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 77
    invoke-virtual {p0, v3}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 78
    .local v4, "child":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_0

    .line 79
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 80
    .local v5, "childHeight":I
    const/4 v6, 0x0

    add-int v7, v5, v2

    invoke-virtual {v4, v6, v2, v1, v7}, Landroid/view/View;->layout(IIII)V

    .line 81
    add-int/2addr v2, v5

    .line 76
    .end local v4    # "child":Landroid/view/View;
    .end local v5    # "childHeight":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 84
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 55
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 56
    .local v0, "maxHeight":I
    invoke-virtual {p0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getMenu()Landroidx/appcompat/view/menu/MenuBuilder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 59
    .local v1, "visibleCount":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->getLabelVisibilityMode()I

    move-result v2

    invoke-virtual {p0, v2, v1}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->isShifting(II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 60
    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->measureShiftingChildHeights(III)I

    move-result v2

    .local v2, "measuredHeight":I
    goto :goto_0

    .line 62
    .end local v2    # "measuredHeight":I
    :cond_0
    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->measureSharedChildHeights(IIILandroid/view/View;)I

    move-result v2

    .line 66
    .restart local v2    # "measuredHeight":I
    :goto_0
    nop

    .line 67
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 68
    const/4 v4, 0x0

    invoke-static {v2, p2, v4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v4

    .line 66
    invoke-virtual {p0, v3, v4}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->setMeasuredDimension(II)V

    .line 69
    return-void
.end method

.method public setItemMinimumHeight(I)V
    .locals 1
    .param p1, "minHeight"    # I

    .line 164
    iget v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->itemMinimumHeight:I

    if-eq v0, p1, :cond_0

    .line 165
    iput p1, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->itemMinimumHeight:I

    .line 166
    invoke-virtual {p0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->requestLayout()V

    .line 168
    :cond_0
    return-void
.end method

.method setMenuGravity(I)V
    .locals 1
    .param p1, "gravity"    # I

    .line 153
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v0, p1, :cond_0

    .line 154
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 155
    iget-object v0, p0, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->layoutParams:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p0, v0}, Lcom/google/android/material/navigationrail/NavigationRailMenuView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    :cond_0
    return-void
.end method
