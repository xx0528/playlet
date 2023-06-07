/*
 * @Author: xx
 * @Date: 2023-06-02 16:53:55
 * @LastEditTime: 2023-06-07 20:15:25
 * @Description:
 */
package response

type PageResult struct {
	List     interface{} `json:"list"`
	Total    int64       `json:"total"`
	Page     int         `json:"page"`
	Over     bool        `json:"over"`
	Offset   int         `json:"offset"`
	PageSize int         `json:"pageSize"`
}
