#!/bin/bash
export LD_LIBRARY_PATH=../sc-machine/bin
if [ ! -d "../ims.ostis.kb_copy" ]; then
    mkdir ../ims.ostis.kb_copy
else
    rm -rf ../ims.ostis.kb_copy/*
fi

cd ../

cp -a ims.ostis.kb/ims/ostis_tech/semantic_network_represent/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/unificated_models/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/tools/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/semantic_networks_processing/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_of_reusable_comp_ui/ui_menu/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/reusable_sc_agents/lib_c_agents/ ims.ostis.kb_copy/

cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/reusable_sc_agents/lib_scp_agents/activity_automatisation ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/reusable_sc_agents/lib_scp_agents/validation ims.ostis.kb_copy/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/programs_for_sc_text_processing/scp_program/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/to_check/ ims.ostis.kb_copy/
cp -a ims.ostis.kb/ui/ ims.ostis.kb_copy/

#EEKB
rm -rf ims.ostis.kb_copy/activity_automatisation/drafts
rm -rf ims.ostis.kb_copy/activity_automatisation/specification
rm -rf ims.ostis.kb_copy/activity_automatisation/manager
rm -rf ims.ostis.kb_copy/activity_automatisation/expert
rm -rf ims.ostis.kb_copy/activity_automatisation/administrator/agent_verif_des_struct
rm -rf ims.ostis.kb_copy/activity_automatisation/administrator/agent_reject_verif_res_offer
rm -rf ims.ostis.kb_copy/activity_automatisation/administrator/agent_appr_verif_res_offer

cp -f kb/eekb/ui_menu_admin_for_eekb.scsi ims.ostis.kb_copy/ui_menu/eekb_commands/activity_automatisation_for_eekb/admin/
cp -f kb/eekb/ui_menu_developer_for_eekb.scsi ims.ostis.kb_copy/ui_menu/eekb_commands/activity_automatisation_for_eekb/developer/
cp -f kb/eekb/ui_menu_root_for_eekb.scsi ims.ostis.kb_copy/ui_menu/eekb_commands/

rm -rf ims.ostis.kb_copy/ui/menu

cd -



