*** Variables ***
${HOME_TITLE}  Automation Exercise
${HOME_FIELD_PESQUISAR}  //input[@id='search_product']
${HOME_BTN_PESQUISAR}  //button[@id='submit_search']
${HOME_TOP_MENU}  //div[@class='shop-menu pull-right']//ul//li
${HOME_PRODUCT}  //div[@class='features_items']//p[text()='Premium Polo T-Shirts']/following-sibling::a[contains(@class, 'add-to-cart')]
${HOME_BTN_CONTINUE}  //button[normalize-space()='Continue Shopping']
${HOME_BTN_CHECKOUT}  xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
${HOME_TOP_MENU_CAMPO_SIGN_UP_LOGIN}  xpath=//a[normalize-space()='{NOME_CAMPO}']
${HOME_LINK_LOGOUT}  xpath=//a[normalize-space()='Logout']