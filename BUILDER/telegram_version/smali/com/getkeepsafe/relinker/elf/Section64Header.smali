.class public Lcom/getkeepsafe/relinker/elf/Section64Header;
.super Lcom/getkeepsafe/relinker/elf/Elf$SectionHeader;
.source "Section64Header.java"


# direct methods
.method public constructor <init>(Lcom/getkeepsafe/relinker/elf/ElfParser;Lcom/getkeepsafe/relinker/elf/Elf$Header;I)V
    .locals 5
    .param p1, "parser"    # Lcom/getkeepsafe/relinker/elf/ElfParser;
    .param p2, "header"    # Lcom/getkeepsafe/relinker/elf/Elf$Header;
    .param p3, "index"    # I
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
    invoke-direct {p0}, Lcom/getkeepsafe/relinker/elf/Elf$SectionHeader;-><init>()V

    .line 25
    const/16 v0, 0x8

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
    iget-wide v1, p2, Lcom/getkeepsafe/relinker/elf/Elf$Header;->shoff:J

    iget v3, p2, Lcom/getkeepsafe/relinker/elf/Elf$Header;->shentsize:I

    mul-int/2addr v3, p3

    int-to-long v3, v3

    add-long/2addr v1, v3

    const-wide/16 v3, 0x2c

    add-long/2addr v1, v3

    invoke-virtual {p1, v0, v1, v2}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readWord(Ljava/nio/ByteBuffer;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/getkeepsafe/relinker/elf/Section64Header;->info:J

    .line 29
    return-void
.end method
