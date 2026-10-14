#include <stdio.h>

struct common {
    int type;  // common initial sequence
};

struct antelope {
    int type;  // common initial sequence

    int loudness;
};

struct octopus {
    int type;

    int sea_creature;
    float intelligence;
};

union animal {
    struct common common;
    struct antelope antelope;
    struct octopus octopus;
};

int main()
{

}
