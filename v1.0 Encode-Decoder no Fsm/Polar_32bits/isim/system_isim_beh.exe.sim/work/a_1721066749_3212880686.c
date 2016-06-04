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
static const char *ng0 = "D:/Dropbox/Thesis Project/Hardware/v1.0 Encode-Decoder no Fsm/Polar_32bits/G.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;
extern char *WORK_P_4053066488;

char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);


static void work_a_1721066749_3212880686_p_0(char *t0)
{
    char t5[16];
    char t17[16];
    char t18[16];
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
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
    char *t36;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t20 = (t0 + 1032U);
    t21 = *((char **)t20);
    t20 = (t0 + 1040U);
    t22 = *((char **)t20);
    t23 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t19, t21, t22);
    t24 = ((WORK_P_4053066488) + 2008U);
    t25 = *((char **)t24);
    t24 = ((WORK_P_4053066488) + 6904U);
    t26 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t18, t23, t19, t25, t24);
    t27 = (t0 + 1192U);
    t28 = *((char **)t27);
    t27 = (t0 + 1200U);
    t29 = *((char **)t27);
    t30 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t17, t26, t18, t28, t29);
    t31 = (t0 + 3072);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t30, 7U);
    xsi_driver_first_trans_fast_port(t31);

LAB2:    t36 = (t0 + 2992);
    *((int *)t36) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t1 = (t0 + 1040U);
    t7 = *((char **)t1);
    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 1200U);
    t10 = *((char **)t8);
    t11 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t5, t6, t7, t9, t10);
    t12 = (t0 + 3072);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t11, 7U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_1721066749_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1721066749_3212880686_p_0};
	xsi_register_didat("work_a_1721066749_3212880686", "isim/system_isim_beh.exe.sim/work/a_1721066749_3212880686.didat");
	xsi_register_executes(pe);
}
