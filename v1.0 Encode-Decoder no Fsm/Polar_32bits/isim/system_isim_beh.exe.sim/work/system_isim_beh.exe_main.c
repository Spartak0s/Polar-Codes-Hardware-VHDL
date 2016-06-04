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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3972351953;
char *WORK_P_4053066488;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3972351953_init();
    work_p_4053066488_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_3289945837_1142133938_init();
    work_a_2064211777_3212880686_init();
    work_a_1881823395_3212880686_init();
    work_a_0515771138_3212880686_init();
    work_a_3959846087_3212880686_init();
    work_a_1911451838_3212880686_init();
    work_a_1721066749_3212880686_init();
    work_a_0422964305_3212880686_init();
    work_a_4250923597_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_2933281589_3212880686_init();


    xsi_register_tops("work_a_2933281589_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    WORK_P_4053066488 = xsi_get_engine_memory("work_p_4053066488");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
