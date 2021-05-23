const save = () => {
  const saveCard = document.getElementById("save_card")
  if (document.getElementById("save_card")) {
  return saveCard;
  };
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge");
    const formData = new FormData(formResult);


      const card = {
        number: formData.get("number"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
      };

      Payjp.createToken(card, (status, response) => {

        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge");
          const tokenObj = `<input value=${token} name='card_token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge").submit();
      });

  });
};

window.addEventListener("load", save);