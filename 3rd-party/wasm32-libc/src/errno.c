int *__errno(void)
{
    static int errno;
    return &errno;
}

static int __errno_storage = 0;

int *__errno_location(void)
{
    return &__errno_storage;
}
