#!/bin/bash

# variáveis com os dados presentes no certificado
nomes=(
);
dia="5 a 9";
mes="Dezembro";
ano="2016";
tempo="4 horas";
evento="Primeira Semana dos Estudos";
dia_assinatura="01";
mes_assinatura="Janeiro";
ano_assinatura="2017";

# caminho para o diretório desejado
cd "~/Documentos/ca/certificados/semana_estudos"


for i in ${!nomes[@]}; do
	unzip certificado.odt -d certificado
	cd certificado
	nome=${nomes[$i]}
	echo $nome $evento $dia $mes $ano $tempo $dia_assinatura $mes_assinatura $ano_assinatura
	sed -i 's/#nome#/'"$nome"'/g' content.xml
	sed -i 's/#evento#/'"$evento"'/g' content.xml
	sed -i 's/#dia#/'"$dia"'/g' content.xml
	sed -i 's/#mes#/'"$mes"'/g' content.xml
	sed -i 's/#ano#/'"$ano"'/g' content.xml
	sed -i 's/#tempo#/'"$tempo"'/g' content.xml
	sed -i 's/#dia_assinatura#/'"$dia_assinatura"'/g' content.xml
	sed -i 's/#mes_assinatura#/'"$mes_assinatura"'/g' content.xml
	sed -i 's/#ano_assinatura#/'"$ano_assinatura"'/g' content.xml
	zip -r "../$nome.odt" *
	cd ..
	libreoffice --headless --convert-to pdf "$nome.odt"
	rm -f "$nome.odt"
	rm -Rf certificado
done
exit 0;
