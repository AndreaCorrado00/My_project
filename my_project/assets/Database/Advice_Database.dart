import 'package:url_launcher/url_launcher.dart';
//void main()
//{
//Random random = new Random();
//int randomNumber = random.nextInt(15); 
//}

// Creare una classe che riceve come costruttore un numero. Tale numero corrisponde al numero del nostro advice
class AdviceSelection{
int? index;

// --- Constructor
AdviceSelection({required this.index});

late var adv=elements[index];

// Metod text: provides the short text of the advice
String? getText(){return adv!['adv_text'];}
// metod get_url: provides the url of the advice
dynamic getUrl(){return adv!['url'];}
}

// The real database for our schopes
// - Remeber to pass to the function that will read the urle the string! Ex: final Uri _url = Uri.parse(adv.getUrl());
var elements={1: adv1};
var adv1={
  'adv_text': 'The impact of the COVID-19 pandemic reversed the steady progress of poverty reduction over the past 25 years. ',
  'url':'https://www.un.org/sustainabledevelopment/poverty/'};

var adv2={
  'adv_text': 'The number of people going hungry and suffering from food insecurity had been gradually rising between 2014 and the onset of the COVID-19 pandemic. ',
  'url':'https://www.un.org/sustainabledevelopment/hunger/'};

var adv3={
  'adv_text': 'The pandemic has severely disrupted essential health services, triggered an increase in the prevalence of anxiety and depression, lowered global life expectancy, derailed progress towards ending HIV, tuberculosis (TB) and malaria.',
  'url':'https://www.un.org/sustainabledevelopment/health/'};

var adv4={
  'adv_text': 'School closures (due to COVID-19 pandemic) have affected girls, children from disadvantaged backgrounds, those living in rural areas, children with disabilities and children from ethnic minorities more than their peers.',
  'url':'https://www.un.org/sustainabledevelopment/education/'};

var adv5={
  'adv_text': 'Gender equality is not only a fundamental human right, but a necessary foundation for a peaceful, prosperous and sustainable world. There has been progress over the last decades, but the world is not on track to achieve gender equality by 2030.',
  'url':'https://www.un.org/sustainabledevelopment/gender-equality/'};

var adv6={
  'adv_text': 'Decades of misuse, poor management, overextraction of groundwater and contamination of freshwater supplies have exacerbated water stress.',
  'url':'https://www.un.org/sustainabledevelopment/water-and-sanitation/'};

var adv7={
  'adv_text': 'Latest data suggest that the world continues to advance towards sustainable energy targets. Nevertheless, the current pace of progress is insufficient to ensure access to clean and affordable energy to everyone by 2030. ',
  'url':'https://www.un.org/sustainabledevelopment/energy/'};

var adv8={
  'adv_text': 'Although the global economy began to rebound in 2021, bringing some improvement in unemployment, recovery remains elusive and fragile.',
  'url':'https://www.un.org/sustainabledevelopment/economic-growth/'};

var adv9={
  'adv_text': 'Higher-technology industries performed better and recovered faster, providing a strong example of how important technological innovation is.',
  'url':'https://www.un.org/sustainabledevelopment/infrastructure-industrialization/'};

var adv10={
  'adv_text': ' Emerging markets and developing economies are experiencing slow recoveries, widening disparities in income between countries. The number of refugees and migrant deaths worldwide reached the highest absolute number on record in 2021.',
  'url':'https://www.un.org/sustainabledevelopment/inequality/'};

var adv11={
  'adv_text': 'Today, more than half the world’s population live in cities. Cities are drivers of economic growth and contribute more than 80 per cent of global GDP.',
  'url':'https://www.un.org/sustainabledevelopment/cities/'};

var adv12={
  'adv_text': 'Unsustainable patterns of consumption and production are root causes of the triple planetary crises of climate change, biodiversity loss and pollution.',
  'url':'https://www.un.org/sustainabledevelopment/sustainable-consumption-production/'};

var adv13={
  'adv_text': 'To limit warming to 1.5° Celsius above pre-industrial levels, as set out in the Paris Agreement, global greenhouse gas emissions will need to peak before 2025. Then they must decline by 43 per cent by 2030 and to net zero by 2050. ',
  'url':'https://www.un.org/sustainabledevelopment/climate-change/'};

var adv14={
  'adv_text': 'Healthy oceans and seas are essential to human existence and life on Earth. They cover 70 per cent of the planet and provide food, energy and water.',
  'url':'https://www.un.org/sustainabledevelopment/oceans/'};

var adv15={
  'adv_text': ' Healthy ecosystems and the biological diversity they support are a source of food, water, medicine, shelter and other material goods.',
  'url':'https://www.un.org/sustainabledevelopment/biodiversity/'};

var adv16={
  'adv_text': 'High levels of armed violence and insecurity have a destructive impact on a country’s development. Sexual violence, crime, exploitation and torture are prevalent where there is conflict or no rule of law.',
  'url':'https://www.un.org/sustainabledevelopment/peace-justice/'};

var adv17={
  'adv_text': 'The 2030 Agenda is universal and calls for action by all countries – developed and developing – to ensure no one is left behind.',
  'url':'https://www.un.org/sustainabledevelopment/globalpartnerships/'};


// My idea of how can we use these link
// A widget (algrthm) with the 'Goal-curiosity of the day'
// Proving a way to read the current date and to convert the current date into a number between 1 and 17
// The widget (HomePage) could show a certain costant text and a mutable text wich is inside this databese. Than there is a link to the page


  





