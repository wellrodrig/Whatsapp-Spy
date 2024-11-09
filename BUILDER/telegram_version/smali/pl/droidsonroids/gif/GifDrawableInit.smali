.class public abstract Lpl/droidsonroids/gif/GifDrawableInit;
.super Ljava/lang/Object;
.source "GifDrawableInit.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lpl/droidsonroids/gif/GifDrawableInit<",
        "TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private mInputSource:Lpl/droidsonroids/gif/InputSource;

.field private mIsRenderingTriggeredOnDraw:Z

.field private mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

.field private final mOptions:Lpl/droidsonroids/gif/GifOptions;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mIsRenderingTriggeredOnDraw:Z

    .line 32
    new-instance v0, Lpl/droidsonroids/gif/GifOptions;

    invoke-direct {v0}, Lpl/droidsonroids/gif/GifOptions;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOptions:Lpl/droidsonroids/gif/GifOptions;

    return-void
.end method


# virtual methods
.method public build()Lpl/droidsonroids/gif/GifDrawable;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-boolean v3, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mIsRenderingTriggeredOnDraw:Z

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOptions:Lpl/droidsonroids/gif/GifOptions;

    invoke-virtual {v0, v1, v2, v3, v4}, Lpl/droidsonroids/gif/InputSource;->createGifDrawable(Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;ZLpl/droidsonroids/gif/GifOptions;)Lpl/droidsonroids/gif/GifDrawable;

    move-result-object v0

    return-object v0

    .line 62
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Source is not set"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public from(Landroid/content/ContentResolver;Landroid/net/Uri;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Landroid/net/Uri;",
            ")TT;"
        }
    .end annotation

    .line 203
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$UriSource;

    invoke-direct {v0, p1, p2}, Lpl/droidsonroids/gif/InputSource$UriSource;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 204
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Landroid/content/res/AssetFileDescriptor;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "assetFileDescriptor"    # Landroid/content/res/AssetFileDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetFileDescriptor;",
            ")TT;"
        }
    .end annotation

    .line 168
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$AssetFileDescriptorSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$AssetFileDescriptorSource;-><init>(Landroid/content/res/AssetFileDescriptor;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 169
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Landroid/content/res/AssetManager;Ljava/lang/String;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;
    .param p2, "assetName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetManager;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 191
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$AssetSource;

    invoke-direct {v0, p1, p2}, Lpl/droidsonroids/gif/InputSource$AssetSource;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 192
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Landroid/content/res/Resources;I)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "resourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "I)TT;"
        }
    .end annotation

    .line 259
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$ResourcesSource;

    invoke-direct {v0, p1, p2}, Lpl/droidsonroids/gif/InputSource$ResourcesSource;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 260
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Ljava/io/File;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TT;"
        }
    .end annotation

    .line 214
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$FileSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$FileSource;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 215
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Ljava/io/FileDescriptor;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "fileDescriptor"    # Ljava/io/FileDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/FileDescriptor;",
            ")TT;"
        }
    .end annotation

    .line 179
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;-><init>(Ljava/io/FileDescriptor;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 180
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Ljava/io/InputStream;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .line 157
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$InputStreamSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$InputStreamSource;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 158
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Ljava/lang/String;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "filePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 225
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$FileSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$FileSource;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 226
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from(Ljava/nio/ByteBuffer;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")TT;"
        }
    .end annotation

    .line 247
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$DirectByteBufferSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$DirectByteBufferSource;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 248
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public from([B)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TT;"
        }
    .end annotation

    .line 236
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Lpl/droidsonroids/gif/InputSource$ByteArraySource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$ByteArraySource;-><init>([B)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 237
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public getExecutor()Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .locals 1

    .line 287
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    return-object v0
.end method

.method public getInputSource()Lpl/droidsonroids/gif/InputSource;
    .locals 1

    .line 269
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    return-object v0
.end method

.method public getOldDrawable()Lpl/droidsonroids/gif/GifDrawable;
    .locals 1

    .line 278
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

    return-object v0
.end method

.method public getOptions()Lpl/droidsonroids/gif/GifOptions;
    .locals 1

    .line 303
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOptions:Lpl/droidsonroids/gif/GifOptions;

    return-object v0
.end method

.method public isRenderingTriggeredOnDraw()Z
    .locals 1

    .line 294
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mIsRenderingTriggeredOnDraw:Z

    return v0
.end method

.method public options(Lpl/droidsonroids/gif/GifOptions;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "options"    # Lpl/droidsonroids/gif/GifOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lpl/droidsonroids/gif/GifOptions;",
            ")TT;"
        }
    .end annotation

    .line 146
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOptions:Lpl/droidsonroids/gif/GifOptions;

    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifOptions;->setFrom(Lpl/droidsonroids/gif/GifOptions;)V

    .line 147
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public renderingTriggeredOnDraw(Z)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "isRenderingTriggeredOnDraw"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 117
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iput-boolean p1, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mIsRenderingTriggeredOnDraw:Z

    .line 118
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public sampleSize(I)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "sampleSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 50
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOptions:Lpl/droidsonroids/gif/GifOptions;

    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifOptions;->setInSampleSize(I)V

    .line 51
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method protected abstract self()Lpl/droidsonroids/gif/GifDrawableInit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public setRenderingTriggeredOnDraw(Z)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "isRenderingTriggeredOnDraw"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 130
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    invoke-virtual {p0, p1}, Lpl/droidsonroids/gif/GifDrawableInit;->renderingTriggeredOnDraw(Z)Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public taskExecutor(Ljava/util/concurrent/ScheduledThreadPoolExecutor;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ScheduledThreadPoolExecutor;",
            ")TT;"
        }
    .end annotation

    .line 99
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 100
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public threadPoolSize(I)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "threadPoolSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 87
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 88
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method

.method public with(Lpl/droidsonroids/gif/GifDrawable;)Lpl/droidsonroids/gif/GifDrawableInit;
    .locals 1
    .param p1, "drawable"    # Lpl/droidsonroids/gif/GifDrawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lpl/droidsonroids/gif/GifDrawable;",
            ")TT;"
        }
    .end annotation

    .line 74
    .local p0, "this":Lpl/droidsonroids/gif/GifDrawableInit;, "Lpl/droidsonroids/gif/GifDrawableInit<TT;>;"
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawableInit;->mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

    .line 75
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawableInit;->self()Lpl/droidsonroids/gif/GifDrawableInit;

    move-result-object v0

    return-object v0
.end method
