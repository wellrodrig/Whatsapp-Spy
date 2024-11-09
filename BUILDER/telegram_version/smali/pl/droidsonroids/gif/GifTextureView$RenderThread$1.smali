.class Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;
.super Ljava/lang/Object;
.source "GifTextureView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpl/droidsonroids/gif/GifTextureView$RenderThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

.field final synthetic val$gifTextureView:Lpl/droidsonroids/gif/GifTextureView;


# direct methods
.method constructor <init>(Lpl/droidsonroids/gif/GifTextureView$RenderThread;Lpl/droidsonroids/gif/GifTextureView;)V
    .locals 0
    .param p1, "this$0"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 208
    iput-object p1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;->this$0:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    iput-object p2, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;->val$gifTextureView:Lpl/droidsonroids/gif/GifTextureView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 211
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;->val$gifTextureView:Lpl/droidsonroids/gif/GifTextureView;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;->this$0:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-static {v1}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$300(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v1

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifTextureView;->access$400(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 212
    return-void
.end method
