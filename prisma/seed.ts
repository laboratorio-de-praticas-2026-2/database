import "dotenv/config";

import {
  PrismaClient,
  UsuarioNivel,
  ObrigacaoTipo,
  ObrigacaoStatus,
  ParceiroTipo,
  FaqCategoria,
  TipoPagamento,
  ParcelaStatus,
  RegimeTributario,
  SolicitacaoStatus,
  StatusValidacao,
  RelatorioCategoria,
  CategoriaBlog,
} from "../generated/prisma/client.js";

import { PrismaMariaDb } from "@prisma/adapter-mariadb";

const rawDatabaseUrl = process.env.DATABASE_URL;

if (!rawDatabaseUrl) {
  throw new Error(
    "DATABASE_URL não está definida. Defina a variável de ambiente DATABASE_URL antes de executar o seed."
  );
}

const databaseUrl = new URL(rawDatabaseUrl);

if (databaseUrl.protocol === "mysql:") {
  databaseUrl.protocol = "mariadb:";
}

const adapter = new PrismaMariaDb(databaseUrl.toString());

const prisma = new PrismaClient({ adapter });

async function main() {
  // ============================================================
  // USUÁRIOS
  // ============================================================

  const usuarios = [
    {
      id: 1,
      nome: "Administrador Sistema",
      email: "admin@contabil.local",
      senha: "senha_segura_123",
      nivel: UsuarioNivel.administrador,
      cpfCnpj: "111.111.111-11",
      celular: "(13) 99999-0001",
    },
    {
      id: 2,
      nome: "João da Silva",
      email: "joao@contabil.local",
      senha: "senha_segura_123",
      nivel: UsuarioNivel.cliente,
      cpfCnpj: "222.222.222-22",
      celular: "(13) 99999-0002",
    },
    {
      id: 3,
      nome: "Maria Oliveira",
      email: "maria@contabil.local",
      senha: "senha_segura_123",
      nivel: UsuarioNivel.cliente,
      cpfCnpj: "333.333.333-33",
      celular: "(13) 99999-0003",
    },
  ];

  for (const usuario of usuarios) {
    await prisma.usuario.upsert({
      where: { id: usuario.id },
      update: {
        nome: usuario.nome,
        email: usuario.email,
        senha: usuario.senha,
        nivel: usuario.nivel,
        cpfCnpj: usuario.cpfCnpj,
        celular: usuario.celular,
      },
      create: usuario,
    });
  }

  console.log("Usuários criados.");


  // ============================================================
  // EMPRESAS
  // ============================================================

  const empresas = [
    {
      id: 1,
      usuarioId: 2,
      razaoSocial: "Empresa Exemplo Comércio Ltda.",
      nomeFantasia: "Exemplo Comércio",
      cnpj: "12.345.678/0001-95",
      regimeTributario: RegimeTributario.simples_nacional,
      inscricaoEstadual: "123.456.789.000",
      inscricaoMunicipal: "987654",
      dataAbertura: new Date("2022-03-15"),
    },
    {
      id: 2,
      usuarioId: 3,
      razaoSocial: "Soluções Administrativas Exemplo Ltda.",
      nomeFantasia: "Soluções Exemplo",
      cnpj: "98.765.432/0001-10",
      regimeTributario: RegimeTributario.lucro_presumido,
      inscricaoEstadual: "987.654.321.000",
      inscricaoMunicipal: "123456",
      dataAbertura: new Date("2021-08-20"),
    },
  ];

  for (const empresa of empresas) {
    await prisma.empresa.upsert({
      where: { id: empresa.id },
      update: {
        usuarioId: empresa.usuarioId,
        razaoSocial: empresa.razaoSocial,
        nomeFantasia: empresa.nomeFantasia,
        cnpj: empresa.cnpj,
        regimeTributario: empresa.regimeTributario,
        inscricaoEstadual: empresa.inscricaoEstadual,
        inscricaoMunicipal: empresa.inscricaoMunicipal,
        dataAbertura: empresa.dataAbertura,
      },
      create: empresa,
    });
  }

  console.log("Empresas criadas.");


  // ============================================================
  // SERVIÇOS
  // ============================================================

  const servicos = [
    {
      id: 1,
      nome: "Regularização de Débitos Fiscais",
      descricao: "Regularização de débitos tributários da empresa",
      valorBase: 350.0,
      prazoEstimadoDias: 5,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 2,
      nome: "Parcelamento de Débitos Fiscais",
      descricao: "Negociação/parcelamento de débitos existentes",
      valorBase: 250.0,
      prazoEstimadoDias: 7,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 3,
      nome: "Recurso de Multa/Infração Fiscal",
      descricao: "Contestação de multas ou infrações fiscais",
      valorBase: 500.0,
      prazoEstimadoDias: 15,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 4,
      nome: "Entrega de Obrigações Acessórias",
      descricao: "Apoio na elaboração e entrega de obrigações",
      valorBase: 300.0,
      prazoEstimadoDias: 5,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 5,
      nome: "Regularização de Obrigações Fiscais",
      descricao: "Regularização de obrigações pendentes ou atrasadas",
      valorBase: 400.0,
      prazoEstimadoDias: 10,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 6,
      nome: "Revisão do Regime Tributário",
      descricao: "Análise do regime tributário atual",
      valorBase: 600.0,
      prazoEstimadoDias: 10,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 7,
      nome: "Planejamento Tributário",
      descricao: "Análise para otimização da carga tributária",
      valorBase: 900.0,
      prazoEstimadoDias: 15,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 8,
      nome: "Regularização Cadastral",
      descricao: "Correção/regularização de dados cadastrais",
      valorBase: 200.0,
      prazoEstimadoDias: 5,
      ativo: true,
      exigeEmpresa: true,
    },
    {
      id: 9,
      nome: "Consultoria Contábil",
      descricao: "Atendimento para análise de questões contábeis/tributárias",
      valorBase: 300.0,
      prazoEstimadoDias: 3,
      ativo: true,
      exigeEmpresa: true,
      deletedAt: new Date("2026-09-10T12:00:00-03:00"),
    },
  ];

  for (const servico of servicos) {
    await prisma.servico.upsert({
      where: { id: servico.id },
      update: {
        nome: servico.nome,
        descricao: servico.descricao,
        valorBase: servico.valorBase,
        prazoEstimadoDias: servico.prazoEstimadoDias,
        ativo: servico.ativo,
        exigeEmpresa: servico.exigeEmpresa,
        deletedAt: servico.deletedAt ?? null,
      },
      create: servico,
    });
  }

  console.log("Serviços criados.");


  // ============================================================
  // BANNERS
  // ============================================================

  const banners = [
    {
      id: 1,
      urlImagem: "https://example.com/banner-tributario.jpg",
      descricao: "Serviços tributários para sua empresa",
      ativo: true,
    },
    {
      id: 2,
      urlImagem: "https://example.com/banner-contabil.jpg",
      descricao: "Consultoria contábil especializada",
      ativo: true,
    },
  ];

  for (const banner of banners) {
    await prisma.banner.upsert({
      where: { id: banner.id },
      update: {
        urlImagem: banner.urlImagem,
        descricao: banner.descricao,
        ativo: banner.ativo,
      },
      create: banner,
    });
  }

  console.log("Banners criados.");


  // ============================================================
  // FAQ
  // ============================================================

  const faqs = [
    {
      id: 1,
      pergunta: "Como funciona a regularização de débitos fiscais?",
      resposta:
        "A regularização começa com a análise dos débitos existentes e definição da melhor estratégia para quitação ou negociação.",
      status: true,
      categoria: FaqCategoria.tributos,
    },
    {
      id: 2,
      pergunta: "É possível parcelar débitos fiscais?",
      resposta:
        "Sim. A possibilidade de parcelamento depende das regras aplicáveis ao débito.",
      status: true,
      categoria: FaqCategoria.tributos,
    },
    {
      id: 3,
      pergunta: "Quais documentos podem ser necessários?",
      resposta:
        "Os documentos variam conforme o serviço solicitado, podendo incluir documentos da empresa e informações fiscais.",
      status: true,
      categoria: FaqCategoria.documentacao,
    },
    {
      id: 4,
      pergunta: "O que são obrigações acessórias?",
      resposta:
        "São declarações e informações que as empresas precisam prestar aos órgãos competentes.",
      status: true,
      categoria: FaqCategoria.obrigacoes_acessorias,
    },
    {
      id: 5,
      pergunta: "Como solicitar uma consultoria contábil?",
      resposta:
        "Basta selecionar o serviço de consultoria e registrar uma solicitação pelo sistema.",
      status: true,
      categoria: FaqCategoria.frequentes,
    },
  ];

  for (const faq of faqs) {
    await prisma.faq.upsert({
      where: { id: faq.id },
      update: {
        pergunta: faq.pergunta,
        resposta: faq.resposta,
        status: faq.status,
        categoria: faq.categoria,
      },
      create: faq,
    });
  }

  console.log("FAQs criadas.");


  // ============================================================
  // BLOG
  // ============================================================

  const blogs = [
    {
      id: 1,
      titulo: "O que são obrigações acessórias?",
      conteudo:
        "As obrigações acessórias são informações que as empresas precisam enviar aos órgãos competentes.",
      dataPublicacao: new Date("2026-09-01"),
      urlImagem: "https://example.com/blog-1.jpg",
      ativo: true,
      olhoDoTexto: "Entenda a importância das obrigações acessórias.",
      categoria: CategoriaBlog.ObrigacoesAcessorias,
    },
    {
      id: 2,
      titulo: "Como funciona o planejamento tributário?",
      conteudo:
        "O planejamento tributário busca analisar alternativas legais para otimizar a carga tributária da empresa.",
      dataPublicacao: new Date("2026-09-05"),
      urlImagem: "https://example.com/blog-2.jpg",
      ativo: true,
      olhoDoTexto: "Veja como analisar o cenário tributário da sua empresa.",
      categoria: CategoriaBlog.Legislacao,
    },
    {
      id: 3,
      titulo: "Cuidados com o pagamento de tributos",
      conteudo:
        "Manter os pagamentos tributários organizados ajuda a evitar pendências e atrasos.",
      dataPublicacao: new Date("2026-09-10"),
      urlImagem: "https://example.com/blog-3.jpg",
      ativo: true,
      olhoDoTexto: "Organização tributária ajuda a evitar problemas futuros.",
      categoria: CategoriaBlog.ImpostoDeRenda,
    },
  ];

  for (const blog of blogs) {
    await prisma.blog.upsert({
      where: { id: blog.id },
      update: {
        titulo: blog.titulo,
        conteudo: blog.conteudo,
        dataPublicacao: blog.dataPublicacao,
        urlImagem: blog.urlImagem,
        ativo: blog.ativo,
        olhoDoTexto: blog.olhoDoTexto,
        categoria: blog.categoria,
      },
      create: blog,
    });
  }

  console.log("Posts do blog criados.");


  // ============================================================
  // PUBLICIDADES
  // ============================================================

  const publicidades = [
    {
      id: 1,
      titulo: "Serviços contábeis",
      conteudo: "Conheça nossos serviços especializados para empresas.",
      urlImagem: "https://example.com/publicidade-1.jpg",
      ativo: true,
    },
    {
      id: 2,
      titulo: "Consultoria empresarial",
      conteudo: "Soluções personalizadas para sua empresa.",
      urlImagem: "https://example.com/publicidade-2.jpg",
      ativo: true,
    },
  ];

  for (const publicidade of publicidades) {
    await prisma.publicidade.upsert({
      where: { id: publicidade.id },
      update: {
        titulo: publicidade.titulo,
        conteudo: publicidade.conteudo,
        urlImagem: publicidade.urlImagem,
        ativo: publicidade.ativo,
      },
      create: publicidade,
    });
  }

  console.log("Publicidades criadas.");


  // ============================================================
  // PARCEIROS
  // ============================================================

  const parceiros = [
    {
      id: 1,
      nomeFantasia: "Banco Exemplo",
      tipo: ParceiroTipo.banco,
      cnpj: "11.222.333/0001-44",
      telefone: "(13) 3333-0001",
      email: "contato@bancoexemplo.local",
      endereco: "Rua Exemplo, 100",
      cidade: "Registro",
      estado: "SP",
      latitude: -24.4875,
      longitude: -47.8436,
      site: "https://example.com",
    },
    {
      id: 2,
      nomeFantasia: "Cartório Exemplo",
      tipo: ParceiroTipo.cartorio,
      cnpj: "55.666.777/0001-88",
      telefone: "(13) 3333-0002",
      email: "contato@cartorioexemplo.local",
      endereco: "Rua Central, 200",
      cidade: "Registro",
      estado: "SP",
      latitude: -24.4870,
      longitude: -47.8430,
      site: "https://example.com",
    },
  ];

  for (const parceiro of parceiros) {
    await prisma.parceiro.upsert({
      where: { id: parceiro.id },
      update: {
        nomeFantasia: parceiro.nomeFantasia,
        tipo: parceiro.tipo,
        cnpj: parceiro.cnpj,
        telefone: parceiro.telefone,
        email: parceiro.email,
        endereco: parceiro.endereco,
        cidade: parceiro.cidade,
        estado: parceiro.estado,
        latitude: parceiro.latitude,
        longitude: parceiro.longitude,
        site: parceiro.site,
      },
      create: parceiro,
    });
  }

  console.log("Parceiros criados.");


  // ============================================================
  // SOLICITAÇÕES
  // ============================================================

  const solicitacoes = [
    {
      id: 1,
      usuarioId: 2,
      empresaId: 1,
      servicoId: 1,
      status: SolicitacaoStatus.em_andamento,
      observacaoCliente: "Preciso regularizar os débitos da empresa.",
      observacaoAdmin: null,
      dataSolicitacao: new Date("2026-09-01T12:00:00-03:00"),
    },
    {
      id: 2,
      usuarioId: 2,
      empresaId: 1,
      servicoId: 7,
      status: SolicitacaoStatus.recebido,
      observacaoCliente: "Gostaria de analisar possibilidades de planejamento tributário.",
      observacaoAdmin: null,
      dataSolicitacao: new Date("2026-09-05T12:00:00-03:00"),
      deletedAt: new Date("2026-09-10T12:00:00-03:00"),
    },
    {
      id: 3,
      usuarioId: 3,
      empresaId: 2,
      servicoId: 4,
      status: SolicitacaoStatus.aguardando_documento,
      observacaoCliente: "Preciso de apoio para uma obrigação acessória.",
      observacaoAdmin: "Aguardando documentos da empresa.",
      dataSolicitacao: new Date("2026-09-08T12:00:00-03:00"),
    },
    {
      id: 4,
      usuarioId: 3,
      empresaId: 2,
      servicoId: 9,
      status: SolicitacaoStatus.concluido,
      observacaoCliente: "Preciso analisar uma questão contábil.",
      observacaoAdmin: "Atendimento concluído.",
      dataConclusao: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
      dataSolicitacao: new Date("2026-09-02T12:00:00-03:00"),
    },
    {
      id: 5,
      usuarioId: 2,
      empresaId: 1,
      servicoId: 6,
      status: SolicitacaoStatus.concluido,
      observacaoCliente: "Revisão tributária realizada no mês anterior.",
      observacaoAdmin: "Concluído com sucesso.",
      dataConclusao: new Date("2026-08-20T12:00:00-03:00"),
      dataSolicitacao: new Date("2026-08-10T12:00:00-03:00"),
    },
  ];

  for (const solicitacao of solicitacoes) {
    await prisma.solicitacao.upsert({
      where: { id: solicitacao.id },
      update: {
        usuarioId: solicitacao.usuarioId,
        empresaId: solicitacao.empresaId,
        servicoId: solicitacao.servicoId,
        status: solicitacao.status,
        observacaoCliente: solicitacao.observacaoCliente,
        observacaoAdmin: solicitacao.observacaoAdmin,
        dataConclusao: solicitacao.dataConclusao,
        dataSolicitacao: solicitacao.dataSolicitacao,
        deletedAt: solicitacao.deletedAt ?? null,
      },
      create: solicitacao,
    });
  }

  console.log("Solicitações criadas.");


  // ============================================================
  // DOCUMENTOS DAS SOLICITAÇÕES
  // ============================================================

  const documentos = [
    {
      id: 1,
      solicitacaoId: 1,
      nomeHash: "documento_empresa_001.pdf",
      tipoDocumento: "Documento empresarial",
      statusValidacao: StatusValidacao.aprovado,
      dataUpload: new Date("2026-09-01T12:00:00-03:00"),
    },
    {
      id: 2,
      solicitacaoId: 1,
      nomeHash: "certidao_001.pdf",
      tipoDocumento: "Certidão",
      statusValidacao: StatusValidacao.pendente,
      dataUpload: new Date("2026-09-02T12:00:00-03:00"),
    },
    {
      id: 3,
      solicitacaoId: 3,
      nomeHash: "obrigacao_003.pdf",
      tipoDocumento: "Documento fiscal",
      statusValidacao: StatusValidacao.pendente,
      dataUpload: new Date("2026-09-08T12:00:00-03:00"),
    },
    {
      id: 4,
      solicitacaoId: 4,
      nomeHash: "documento_contabil_004.pdf",
      tipoDocumento: "Documento contábil",
      statusValidacao: StatusValidacao.aprovado,
      dataUpload: new Date("2026-09-03T12:00:00-03:00"),
    },
    {
      id: 5,
      solicitacaoId: 3,
      nomeHash: null,
      tipoDocumento: "Contrato Social Atualizado",
      dataUpload: null,
      statusValidacao: StatusValidacao.pendente,
    },
    {
      id: 6,
      solicitacaoId: 3,
      nomeHash: null,
      tipoDocumento: "Comprovante de Inscrição Estadual",
      dataUpload: null,
      statusValidacao: StatusValidacao.pendente,
    },
  ];

  for (const documento of documentos) {
    await prisma.documentoSolicitacao.upsert({
      where: { id: documento.id },
      update: {
        solicitacaoId: documento.solicitacaoId,
        nomeHash: documento.nomeHash,
        tipoDocumento: documento.tipoDocumento,
        statusValidacao: documento.statusValidacao,
        dataUpload: documento.dataUpload ?? null,
      },
      create: documento,
    });
  }

  console.log("Documentos criados.");


  // ============================================================
  // OBRIGAÇÕES
  // ============================================================
  
  const hoje = new Date();
  const em7Dias = new Date();
  em7Dias.setDate(hoje.getDate() + 7);

  const obrigacoes = [
    {
      id: 1,
      tipo: ObrigacaoTipo.servico,
      descricao: "Regularização de débitos fiscais",
      valor: 350.0,
      status: ObrigacaoStatus.pendente,
      competencia: new Date("2026-08-01T12:00:00-03:00"),
      vencimento: new Date("2026-09-30T12:00:00-03:00"),
    },
    {
      id: 2,
      tipo: ObrigacaoTipo.servico,
      descricao: "Planejamento tributário",
      valor: 900.0,
      status: ObrigacaoStatus.pago,
      competencia: new Date("2026-08-01T12:00:00-03:00"),
      vencimento: new Date("2026-09-10T12:00:00-03:00"),
    },
    {
      id: 3,
      tipo: ObrigacaoTipo.empresa,
      descricao: "Regularização de obrigação fiscal",
      valor: 400.0,
      status: ObrigacaoStatus.pendente,
      competencia: new Date("2026-08-01T12:00:00-03:00"),
      vencimento: new Date("2026-09-25T12:00:00-03:00"),
    },
    {
      id: 4,
      tipo: ObrigacaoTipo.empresa,
      descricao: "Consultoria contábil",
      valor: 300.0,
      status: ObrigacaoStatus.pago,
      competencia: new Date("2026-08-01T12:00:00-03:00"),
      vencimento: new Date("2026-09-05T12:00:00-03:00"),
    },
    {
      id: 5,
      tipo: ObrigacaoTipo.empresa,
      descricao: "DAS / Simples Nacional",
      valor: 150.0,
      status: ObrigacaoStatus.pendente,
      competencia: new Date("2026-08-01T12:00:00-03:00"),
      vencimento: hoje,
    },
    {
      id: 6,
      tipo: ObrigacaoTipo.empresa,
      descricao: "Taxa de Funcionamento",
      valor: 200.0,
      status: ObrigacaoStatus.pendente,
      competencia: new Date("2026-08-01T12:00:00-03:00"),
      vencimento: em7Dias,
    },
  ];

  for (const obrigacao of obrigacoes) {
    await prisma.obrigacao.upsert({
      where: { id: obrigacao.id },
      update: {
        tipo: obrigacao.tipo,
        descricao: obrigacao.descricao, 
        valor: obrigacao.valor,
        status: obrigacao.status,
        competencia: obrigacao.competencia,
        vencimento: obrigacao.vencimento,
      },
      create: obrigacao,
    });
  }

  console.log("Obrigações criadas.");


  // ============================================================
  // OBRIGAÇÃO x SERVIÇO
  // ============================================================

  const obrigacoesServico = [
    {
      id: 1,
      idObrigacao: 1,
      idServico: 1,
      solicitacaoId: 1,
    },
    {
      id: 2,
      idObrigacao: 2,
      idServico: 7,
      solicitacaoId: 2,
    },
  ];

  for (const item of obrigacoesServico) {
    await prisma.obrigacaoServico.upsert({
      where: { id: item.id },
      update: {
        idObrigacao: item.idObrigacao,
        idServico: item.idServico,
        solicitacaoId: item.solicitacaoId,
      },
      create: item,
    });
  }

  console.log("Relações obrigação-serviço criadas.");


  // ============================================================
  // OBRIGAÇÃO x EMPRESA
  // ============================================================

  const obrigacoesEmpresa = [
    {
      id: 1,
      idObrigacao: 3,
      idEmpresa: 1,
    },
    {
      id: 2,
      idObrigacao: 4,
      idEmpresa: 2,
    },
  ];

  for (const item of obrigacoesEmpresa) {
    await prisma.obrigacaoEmpresa.upsert({
      where: { id: item.id },
      update: {
        idObrigacao: item.idObrigacao,
        idEmpresa: item.idEmpresa,
      },
      create: item,
    });
  }

  console.log("Relações obrigação-empresa criadas.");


  


  // ============================================================
  // PARCELAS
  // ============================================================

  const parcelas = [
    {
      id: 1,
      idPagamento: 2,
      valor: 150.0,
      numeroParcela: 1,
      status: ParcelaStatus.pago,
      vencimento: new Date("2026-09-05T12:00:00-03:00"),
    },
    {
      id: 2,
      idPagamento: 2,
      valor: 150.0,
      numeroParcela: 2,
      status: ParcelaStatus.pago,
      vencimento: new Date("2026-10-05T12:00:00-03:00"),
    },
    {
      id: 3,
      idPagamento: 1,
      valor: 900.0,
      numeroParcela: 1,
      status: ParcelaStatus.pago,
      vencimento: new Date("2026-09-10T12:00:00-03:00"),
    },
    {
      id: 4,
      idPagamento: 3,
      valor: 350.0,
      numeroParcela: 1,
      status: ParcelaStatus.ativo,
      vencimento: new Date("2026-09-30T12:00:00-03:00"),
    },
    {
      id: 5,
      idPagamento: 4,
      valor: 200.0,
      numeroParcela: 1,
      status: ParcelaStatus.ativo,
      vencimento: new Date("2026-08-15T12:00:00-03:00"),
    },
    {
      id: 6,
      idPagamento: 4,
      valor: 200.0,
      numeroParcela: 2,
      status: ParcelaStatus.ativo,
      vencimento: new Date("2026-10-15T12:00:00-03:00"),
    },
  ];

  for (const parcela of parcelas) {
    await prisma.parcela.upsert({
      where: { id: parcela.id },
      update: {
        idPagamento: parcela.idPagamento,
        valor: parcela.valor,
        numeroParcela: parcela.numeroParcela,
        status: parcela.status,
        vencimento: parcela.vencimento,
      },
      create: parcela,
    });
  }

  console.log("Parcelas criadas.");


  // ============================================================
  // EMAILS ENVIADOS
  // ============================================================

  const emails = [
    {
      id: 1,
      nomeUsuario: "João da Silva",
      emailUsuario: "joao@contabil.local",
      textoDigitado: "Gostaria de saber como funciona o planejamento tributário.",
      assunto: "Dúvida sobre planejamento tributário",
    },
    {
      id: 2,
      nomeUsuario: "Maria Oliveira",
      emailUsuario: "maria@contabil.local",
      textoDigitado: "Preciso de ajuda com uma obrigação acessória.",
      assunto: "Dúvida sobre obrigação acessória",
    },
  ];

  for (const email of emails) {
    await prisma.emailEnviado.upsert({
      where: { id: email.id },
      update: {
        nomeUsuario: email.nomeUsuario,
        emailUsuario: email.emailUsuario,
        textoDigitado: email.textoDigitado,
        assunto: email.assunto,
      },
      create: email,
    });
  }

  console.log("Emails criados.");


  // ============================================================
  // INTERAÇÕES DO USUÁRIO
  // ============================================================

  const interacoes = [
    {
      id: 1,
      usuarioId: 2,
      categoriaBlog: CategoriaBlog.ObrigacoesAcessorias,
      dataInteracao: new Date("2026-09-10"),
    },
    {
      id: 2,
      usuarioId: 2,
      categoriaBlog: CategoriaBlog.Legislacao,
      dataInteracao: new Date("2026-09-11"),
    },
    {
      id: 3,
      usuarioId: 3,
      categoriaBlog: CategoriaBlog.ImpostoDeRenda,
      dataInteracao: new Date("2026-09-12"),
    },
  ];

  for (const interacao of interacoes) {
    await prisma.interacaoUsuario.upsert({
      where: { id: interacao.id },
      update: {
        usuarioId: interacao.usuarioId,
        categoriaBlog: interacao.categoriaBlog,
        dataInteracao: interacao.dataInteracao,
      },
      create: interacao,
    });
  }

  console.log("Interações criadas.");


  // ============================================================
  // RELATÓRIOS
  // ============================================================

  const relatorios = [
    {
      id: 1,
      nome: "Relatório Completo - Setembro 2026",
      descricao: "Relatório geral das atividades do sistema.",
      categoria: RelatorioCategoria.relatorio_completo,
      urlDocumentoHash: "relatorio_completo_setembro_2026.pdf",
      dataGeracao: new Date("2026-09-19"),
      periodoInicio: new Date("2026-09-01"),
      periodoFim: new Date("2026-09-30"),
    },
    {
      id: 2,
      nome: "Relatório de Solicitações - Setembro 2026",
      descricao: "Relatório das solicitações registradas no período.",
      categoria: RelatorioCategoria.gestao_solicitacoes,
      urlDocumentoHash: "relatorio_solicitacoes_setembro_2026.pdf",
      dataGeracao: new Date("2026-09-19"),
      periodoInicio: new Date("2026-09-01"),
      periodoFim: new Date("2026-09-30"),
    },
  ];

  for (const relatorio of relatorios) {
    await prisma.relatorio.upsert({
      where: { id: relatorio.id },
      update: {
        nome: relatorio.nome,
        descricao: relatorio.descricao,
        categoria: relatorio.categoria,
        urlDocumentoHash: relatorio.urlDocumentoHash,
        dataGeracao: relatorio.dataGeracao,
        periodoInicio: relatorio.periodoInicio,
        periodoFim: relatorio.periodoFim,
      },
      create: relatorio,
    });
  }

  console.log("Relatórios criados.");

  console.log("========================================");
  console.log("Seed concluído com sucesso!");
  console.log("========================================");
}

main()
  .catch((error) => {
    console.error("Erro durante o seed:", error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });