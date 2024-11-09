.class Lpl/droidsonroids/gif/ConditionVariable;
.super Ljava/lang/Object;
.source "ConditionVariable.java"


# instance fields
.field private volatile mCondition:Z


# direct methods
.method constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized block()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    monitor-enter p0

    .line 43
    nop

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lpl/droidsonroids/gif/ConditionVariable;->mCondition:Z

    if-nez v0, :cond_0

    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 46
    .end local p0    # "this":Lpl/droidsonroids/gif/ConditionVariable;
    :cond_0
    monitor-exit p0

    return-void

    .line 42
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 39
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lpl/droidsonroids/gif/ConditionVariable;->mCondition:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    monitor-exit p0

    return-void

    .line 38
    .end local p0    # "this":Lpl/droidsonroids/gif/ConditionVariable;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized open()V
    .locals 2

    monitor-enter p0

    .line 31
    :try_start_0
    iget-boolean v0, p0, Lpl/droidsonroids/gif/ConditionVariable;->mCondition:Z

    .line 32
    .local v0, "old":Z
    const/4 v1, 0x1

    iput-boolean v1, p0, Lpl/droidsonroids/gif/ConditionVariable;->mCondition:Z

    .line 33
    if-nez v0, :cond_0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .end local p0    # "this":Lpl/droidsonroids/gif/ConditionVariable;
    :cond_0
    monitor-exit p0

    return-void

    .line 30
    .end local v0    # "old":Z
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized set(Z)V
    .locals 0
    .param p1, "state"    # Z

    monitor-enter p0

    .line 23
    if-eqz p1, :cond_0

    .line 24
    :try_start_0
    invoke-virtual {p0}, Lpl/droidsonroids/gif/ConditionVariable;->open()V

    goto :goto_0

    .line 26
    .end local p0    # "this":Lpl/droidsonroids/gif/ConditionVariable;
    :cond_0
    invoke-virtual {p0}, Lpl/droidsonroids/gif/ConditionVariable;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :goto_0
    monitor-exit p0

    return-void

    .line 22
    .end local p1    # "state":Z
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
