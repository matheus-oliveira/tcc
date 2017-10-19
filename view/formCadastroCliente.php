<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

  </head>
  <body>
    <div class="container" col-md-8 col-sm-8 col-lg-8>
      <div class="col-md-3">
        <!--responsavel pelo alinhamento ao centro do
          form definido para ocupar 3 posicoes na grid do lado direito--->
      </div>
<form class="col-md-6" action="index.html" method="post">


      <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" class="form-control" id="nome" placeholder="Digite seu nome">
        <!-- <p class="help-block">Help text here.</p>-->
      </div>
    <div class="form-group">
      <label for="cpf">Cpf</label>
      <input type="text" class="form-control" id="cpf" placeholder="Digite seu CPF">
      <!-- <p class="help-block">Help text here.</p>-->
    </div>
    <div class="form-group" >
      <label for="">Sexo</label>
      <div class='radio-inline'>
        <label>
          <input type='radio' name='optradio' value='masculino'>
          Masculino
        </label>
      </div>
      <div class='radio-inline'>
        <label>
          <input type='radio' name='optradio' value='feminino'>
          Feminino
        </label>
      </div>

      </div>
      <div class="form-group" >
        <label for="dataNasc">Data de nascimento</label>
        <input type="date" class="form-control" id="dataNasc">
        <!-- <p class="help-block">Help text here.</p>-->
      </div>
      <div class="form-group ">

        <div class="col-xs-10" >
          <label for="endereco">Endereço</label>
          <input type="text" class="form-control" id="endereco" placeholder="Digite seu endereço completo">
          <!-- <p class="help-block">Help text here.</p>-->
        </div>
        <div class="col-xs-2" >
          <label for="casa">Casa</label>
          <input type="casa" class="form-control" id="casa" placeholder="Nº">
        </div>

      </div>



    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" placeholder="Digite seu email">
      <!-- <p class="help-block">Help text here.</p>-->

    </div>
    <div class="form-group">
      <label for="confirmeEmail">Comfirme seu email</label>
      <input type="email" class="form-control" id="confirmeEmail" placeholder="Confirme seu email">
      <!-- <p class="help-block">Help text here.</p>-->
    </div>
    <div class="form-group">
      <label for="senha">Senha</label>
      <input type="password" class="form-control" id="senha" placeholder="Digite sua senha">
      <!-- <p class="help-block">Help text here.</p>-->
    </div>

  <div class="form-group">
    <label for="confirmeSenha" >Comfirme sua senha</label>
    <input type="password" class="form-control" id="confirmeSenha" placeholder="Confirme sua senha">
    <!-- <p class="help-block">Help text here.</p>-->
  </div>



</form>
<div class="col-md-3">
  <!--responsavel pelo alinhamento ao centro do
    form definido para ocupar 3 posicoes na grid do lado direito--->
</div>



  </div><!-- fim div container-->

    </form>
  </body>
</html>
