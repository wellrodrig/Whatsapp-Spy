.class public Lcom/getkeepsafe/relinker/elf/Program32Header;
.super Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;
.source "Program32Header.java"


# direct methods
.method public constructor <init>(Lcom/getkeepsafe/relinker/elf/ElfParser;Lcom/getkeepsafe/relinker/elf/Elf$Header;J)V
    .locals 5
    .param p1, "parser"    # Lcom/getkeepsafe/relinker/elf/ElfParser;
    .param p2, "header"    # Lcom/getkeepsafe/relinker/elf/Elf$Header;
    .param p3, "index"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10
        }
        names = {
            "parser",
            "header",
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;-><init>()V

    .line 25
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 26
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    iget-boolean v1, p2, Lcom/getkeepsafe/relinker/elf/Elf$Header;->bigEndian:Z

    if-eqz v1, :cond_0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    :cond_0
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    :goto_0
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 28
    iget-wide v1, p2, Lcom/getkeepsafe/relinker/elf/Elf$Header;->phoff:J

    iget v3, p2, Lcom/getkeepsafe/relinker/elf/Elf$Header;->phentsize:I

    int-to-long v3, v3

    mul-long/2addr v3, p3

    add-long/2addr v1, v3

    .line 29
    .local v1, "baseOffset":J
    invoke-virtual {p1, v0, v1, v2}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readWord(Ljava/nio/ByteBuffer;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/getkeepsafe/relinker/elf/Program32Header;->type:J

    .line 30
    const-wide/16 v3, 0x4

    add-long/2addr v3, v1

    invoke-virtual {p1, v0, v3, v4}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readWord(Ljava/nio/ByteBuffer;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/getkeepsafe/relinker/elf/Program32Header;->offset:J

    .line 31
    const-wide/16 v3, 0x8

    add-long/2addr v3, v1

    invoke-virtual {p1, v0, v3, v4}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readWord(Ljava/nio/ByteBuffer;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/getkeepsafe/relinker/elf/Program32Header;->vaddr:J

    .line 32
    const-wide/16 v3, 0x14

    add-long/2addr v3, v1

    invoke-virtual {p1, v0, v3, v4}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readWord(Ljava/nio/ByteBuffer;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/getkeepsafe/relinker/elf/Program32Header;->memsz:J

    .line 33
    return-void
.end method
