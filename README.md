# TP Aniversário

Aplicativo Flutter para verificar aniversários. O usuário preenche o primeiro nome e a data de nascimento, e a aplicação confere se o dia e o mês coincidem com a data atual. Se for aniversário, aparece uma tela de parabenização personalizada; caso contrário, é exibido um snackbar informando quantos dias faltam.

## Tecnologias usadas

- Flutter: `3.41.9` (canal `stable`)
- Dart: `3.11.5` (instalado no sistema; `pubspec.yaml` declara `sdk: '>=2.19.4 <3.0.0'`)
- Material Design: incluído (`uses-material-design: true`)
- Android / iOS: iOS deployment target `11.0`; Android SDK definido pelo Flutter (compileSdk configurado pelo SDK)
- Flutter Web: suportado (configuração via Flutter SDK)


## Como usar

1. Execute o app em um dispositivo ou emulador.
2. Preencha o nome.
3. Selecione a data de nascimento.
4. Toque em enviar para ver o resultado.

## Vídeo de demonstração

<a href="https://github.com/user-attachments/assets/videos/1000222262.mp4">
  <img src="./assets/img/thumb-video.png" width="300">
</a>

## Observações

- O cálculo considera apenas dia e mês do aniversário.
- O app mostra um snackbar com a contagem de dias restantes quando não é aniversário.
