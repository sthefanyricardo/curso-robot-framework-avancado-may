*** Variables ***
${HOME_TITLE}  Automation Exercise
${HOME_FIELD_PESQUISAR}  name=search_query
${HOME_BTN_PESQUISAR}  name=submit_search
${HOME_TOPMENU}  //div[@class='shop-menu pull-right']//ul//li
${HOME_PRODUCT}  xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
${HOME_BTN_ADDCART}  xpath=//*[@id="add_to_cart"]/button
${HOME_BTN_CHECKOUT}  xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
${HOME_TOP_MENU_CAMPO_SIGN_UP_LOGIN}  xpath=//a[normalize-space()='{NOME_CAMPO}']
${HOME_LINK_LOGOUT}  xpath=//a[normalize-space()='Logout']