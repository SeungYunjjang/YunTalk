enum LocalizedKeySet: String {
	case login
	case confirm
	case cancel
	case guide
	case following
	case follower
	case exchange
	case refund
	case product_inquire_list
	case order_inquire_list
	case exchange_inquire_list
	case delivery_inquire_list
	case member_inquire_list
	case ppoint_inquire_list
	case coupon_inquire_list
	case other_inquire_list
	case mine_inquire_list
	case wirte_inquire_list
	case product_subscript_inquire_list
	case order_subscript_inquire_list
	case exchange_subscript_inquire_list
	case delivery_subscript_inquire_list
	case member_subscript_inquire_list
	case ppoint_subscript_inquire_list
	case coupon_subscript_inquire_list
	case other_subscript_inquire_list
	case mine_subscript_inquire_list
	case wirte_subscript_inquire_list
	case toast_msg_server_error
	case toast_msg_login_result_1
	case toast_msg_login_result_2
	case toast_msg_login_result_3
	case toast_msg_login_result_4
	case toast_msg_login_result_5
	case toast_msg_join_result_1
	case toast_msg_create_id_result_1
	case toast_msg_create_id_result_2
	case toast_msg_create_id_result_3
	case toast_msg_create_id_result_4
	case toast_msg_list_not_entered
	case toast_msg_post_zipcode_result
	case toast_msg_create_info_result_1
	case toast_msg_create_info_result_2
	case toast_msg_create_info_result_3
	case toast_msg_find_pw_result
	case toast_msg_find_id_result_1
	case toast_msg_find_id_result_2
	case toast_msg_find_id_result_3
	case toast_msg_find_id_result_4
	case toast_msg_find_id_result_5
	case text_field_road_placeholder
	case alert_sex_list_title
	case alert_sex_list_fisrt_content
	case alert_sex_list_second_content
	case alert_profile_image_title_content
	case alert_profile_back_image_title_content
	case alert_profile_image_first_content
	case alert_profile_image_second_content
	case alert_profile_image_third_content
	case alert_center_term_title
	case alert_center_personal_info_title
	case alert_center_policy_title
	case second_pw_current_msg
	case second_pw_msg
	case second_pw_check_msg
	case second_pw_change_msg
	case second_pw_chage_check_msg
	case second_pw_complete_msg
	case second_pw_uncheck_msg
	case second_pw_uncheck_five_time_msg
	case cancel_in_process
	case exchange_in_process
	case refund_in_process
	case change_size
	case select_size
	case change_color
	case select_color
	case apply_cancel
	case cancel_apply_msg
	case exchange_apply_msg
	case refund_apply_msg
	case order_cancel
	case cancel_apply
	case exchange_apply
	case refund_apply
	case product_order_request_start_msg
	case product_order_request_end_msg
	case product_order_request_end_second_msg
	case cancel_request_title
	case exchange_request_title
	case refund_request_title
	case cancel_reason_title
	case exchnage_reason_title
	case refund_reason_title

	var localized: String {
		return String(describing: self).localized
	}
}
