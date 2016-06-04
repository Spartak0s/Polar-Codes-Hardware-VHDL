/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Dropbox/Thesis Project/Hardware/v1.0 Encode-Decoder no Fsm/Polar_32bits/F.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_4053066488;
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_2720006528_1035706684(char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_1911451838_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_4053066488) + 1888U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 6);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = *((unsigned char *)t1);
    t10 = (t0 + 1192U);
    t11 = *((char **)t10);
    t10 = ((WORK_P_4053066488) + 1888U);
    t12 = *((char **)t10);
    t13 = *((int *)t12);
    t14 = (t13 - 6);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t10 = (t11 + t17);
    t18 = *((unsigned char *)t10);
    t19 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t9, t18);
    t20 = (t0 + 4608);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = t19;
    xsi_driver_first_trans_fast(t20);

LAB2:    t25 = (t0 + 4464);
    *((int *)t25) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1911451838_3212880686_p_1(char *t0)
{
    char t11[16];
    char t12[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    unsigned char t10;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_4053066488) + 1888U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 6);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = *((unsigned char *)t1);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB7:    t29 = (t0 + 1032U);
    t30 = *((char **)t29);
    t29 = (t0 + 4672);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t30, 7U);
    xsi_driver_first_trans_fast(t29);

LAB2:    t35 = (t0 + 4480);
    *((int *)t35) = 1;

LAB1:    return;
LAB3:    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t13 = (t0 + 1040U);
    t15 = *((char **)t13);
    t16 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t12, t14, t15);
    t17 = ((WORK_P_4053066488) + 2008U);
    t18 = *((char **)t17);
    t17 = ((WORK_P_4053066488) + 6904U);
    t19 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t11, t16, t12, t18, t17);
    t20 = (t11 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    t23 = (7U != t22);
    if (t23 == 1)
        goto LAB5;

LAB6:    t24 = (t0 + 4672);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t19, 7U);
    xsi_driver_first_trans_fast(t24);
    goto LAB2;

LAB5:    xsi_size_not_matching(7U, t22, 0);
    goto LAB6;

LAB8:    goto LAB2;

}

static void work_a_1911451838_3212880686_p_2(char *t0)
{
    char t11[16];
    char t12[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    unsigned char t10;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_4053066488) + 1888U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 6);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = *((unsigned char *)t1);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB7:    t29 = (t0 + 1192U);
    t30 = *((char **)t29);
    t29 = (t0 + 4736);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t30, 7U);
    xsi_driver_first_trans_fast(t29);

LAB2:    t35 = (t0 + 4496);
    *((int *)t35) = 1;

LAB1:    return;
LAB3:    t13 = (t0 + 1192U);
    t14 = *((char **)t13);
    t13 = (t0 + 1200U);
    t15 = *((char **)t13);
    t16 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t12, t14, t15);
    t17 = ((WORK_P_4053066488) + 2008U);
    t18 = *((char **)t17);
    t17 = ((WORK_P_4053066488) + 6904U);
    t19 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t11, t16, t12, t18, t17);
    t20 = (t11 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    t23 = (7U != t22);
    if (t23 == 1)
        goto LAB5;

LAB6:    t24 = (t0 + 4736);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t19, 7U);
    xsi_driver_first_trans_fast(t24);
    goto LAB2;

LAB5:    xsi_size_not_matching(7U, t22, 0);
    goto LAB6;

LAB8:    goto LAB2;

}

static void work_a_1911451838_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int t25;
    char *t26;
    int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 7396U);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t3 = (t0 + 7396U);
    t5 = ieee_p_1242562249_sub_2720006528_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB3;

LAB4:
LAB5:    t22 = (t0 + 1672U);
    t23 = *((char **)t22);
    t22 = ((WORK_P_4053066488) + 1648U);
    t24 = *((char **)t22);
    t25 = *((int *)t24);
    t22 = ((WORK_P_4053066488) + 1768U);
    t26 = *((char **)t22);
    t27 = *((int *)t26);
    t28 = (t25 + t27);
    t29 = (t28 - 1);
    t30 = (6 - t29);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t22 = (t23 + t32);
    t33 = (t0 + 4800);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t22, 7U);
    xsi_driver_first_trans_fast(t33);

LAB2:    t38 = (t0 + 4512);
    *((int *)t38) = 1;

LAB1:    return;
LAB3:    t6 = (t0 + 1512U);
    t7 = *((char **)t6);
    t6 = ((WORK_P_4053066488) + 1648U);
    t8 = *((char **)t6);
    t9 = *((int *)t8);
    t6 = ((WORK_P_4053066488) + 1768U);
    t10 = *((char **)t6);
    t11 = *((int *)t10);
    t12 = (t9 + t11);
    t13 = (t12 - 1);
    t14 = (6 - t13);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t6 = (t7 + t16);
    t17 = (t0 + 4800);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 7U);
    xsi_driver_first_trans_fast(t17);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_1911451838_3212880686_p_4(char *t0)
{
    char t10[16];
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t12 = (t0 + 1832U);
    t13 = *((char **)t12);
    t12 = (t0 + 1840U);
    t14 = *((char **)t12);
    t15 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t11, t13, t14);
    t16 = ((WORK_P_4053066488) + 2008U);
    t17 = *((char **)t16);
    t16 = ((WORK_P_4053066488) + 6904U);
    t18 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t10, t15, t11, t17, t16);
    t19 = (t0 + 4864);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t18, 7U);
    xsi_driver_first_trans_fast_port(t19);

LAB2:    t24 = (t0 + 4528);
    *((int *)t24) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t1 = (t0 + 4864);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 7U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_1911451838_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1911451838_3212880686_p_0,(void *)work_a_1911451838_3212880686_p_1,(void *)work_a_1911451838_3212880686_p_2,(void *)work_a_1911451838_3212880686_p_3,(void *)work_a_1911451838_3212880686_p_4};
	xsi_register_didat("work_a_1911451838_3212880686", "isim/system_isim_beh.exe.sim/work/a_1911451838_3212880686.didat");
	xsi_register_executes(pe);
}
